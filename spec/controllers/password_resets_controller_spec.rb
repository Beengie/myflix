require 'spec_helper'

describe PasswordResetsController do
  describe "GET show" do
    it "renders show template if the token is valid" do
      lalaine = Fabricate(:user)
      lalaine.update_column(:token, '12345')
      get :show, id: '12345'
      expect(response).to render_template :show
    end

    it "sets @token" do
      lalaine = Fabricate(:user)
      lalaine.update_column(:token, '12345')
      get :show, id: '12345'
      expect(assigns(:token)).to eql('12345')
    end

    it "redirects to the expired token page if the token is not valid" do
      get :show, id: '12345'
      expect(response).to redirect_to expired_token_path
    end
  end

  describe "POST create" do
    context "with valid token" do
      it "redirects to the sign in page" do
        lalaine = Fabricate(:user, password: 'old_password')
        lalaine.update_column(:token, '12345')
        post :create, token: '12345', password: 'new_password'
      expect(response).to redirect_to sign_in_path
      end
      it "should update the user's password" do
        lalaine = Fabricate(:user, password: 'old_password')
        lalaine.update_column(:token, '12345')
        post :create, token: '12345', password: 'new_password'
        expect(lalaine.reload.authenticate('new_password')).to be_true
      end
      it "sets the success message" do
        lalaine = Fabricate(:user, password: 'old_password')
        lalaine.update_column(:token, '12345')
        post :create, token: '12345', password: 'new_password'
        expect(flash[:success]).to be_present
      end
      it "regenerates the user token" do
        lalaine = Fabricate(:user, password: 'old_password')
        lalaine.update_column(:token, '12345')
        post :create, token: '12345', password: 'new_password'
        expect(lalaine.reload.token).not_to  eq('12345')
      end
    end
    context "with invalid token" do
      it "redirects to the epired token path" do
        post :create, token: '12345', password: 'some_password'
        expect(response).to redirect_to expired_token_path
      end
    end
  end
end