class InvitationsController < ApplicationController
  before_filter :require_user
  def new
    @invitation = Invitation.new
  end
  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.inviter_id = current_user.id
      if @invitation.save
      AppMailer.send_invitation_email(@invitation).deliver
      flash[:success] = "You have successfully invited #{@invitation.recipient_name}"
      redirect_to new_invitation_path
    else
      flash[:danger] = "Please check your inputs."
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:recipient_name, :recipient_email, :message, :inviter_id)
  end
end