require 'spec_helper'

describe ForgotPasswordsController do
  describe 'POST create' do
    # add blank
    context 'email is valid' do
      it 'should redirect to the confirm password reset page' do
        lalaine = Fabricate(:user, email: 'lalaine@example.com')
        post :create, email: 'lalaine@example.com'
        expect(response).to redirect_to forgot_password_confirmation_path
      end
      it 'should assign @user by email' do
        lalaine = Fabricate(:user, email: 'lalaine@example.com')
        post :create, email: lalaine.email
        expect(assigns(:user)).to eq(lalaine)
      end
      it 'should deliver an email to user' do
        lalaine = Fabricate(:user, email: 'lalaine@example.com')
        post :create, email: lalaine.email
        mail = ActionMailer::Base.deliveries
        expect(mail).to_not be_empty
      end
      it 'should deliver to the correct recipient' do
        lalaine = Fabricate(:user, email: 'lalaine@example.com')
        post :create, email: lalaine.email
        mail = ActionMailer::Base.deliveries.last
        expect(mail.to).to eq([lalaine.email])
      end
      it 'should contain a link to the reset password page' do
        lalaine = Fabricate(:user, email: 'lalaine@example.com')
        post :create, email: lalaine.email
        mail = ActionMailer::Base.deliveries.last
        expect(mail.body).to include('reset password')
      end
    end
    context 'input is blank' do
      it 'redirects to forgot password page' do
        lalaine = Fabricate(:user, email: 'lalaine@example.com')
        post :create, email: ''
        expect(response).to redirect_to forgot_password_path
      end
    end
    context 'email is not valid' do
      it 'should flash message if email is not valid' do
        lalaine = Fabricate(:user, email: 'lalaine@example.com')
        post :create, email: 'other@example.com'
        expect(flash[:danger]).to eq('That email is not in our sytem.')
      end

      it 'should redirect to forgot password page' do
        lalaine = Fabricate(:user, email: 'lalaine@example.com')
        post :create, email: 'other@example.com'
        expect(response).to redirect_to forgot_password_path
      end
    end
  end
end