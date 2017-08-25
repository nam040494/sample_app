class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]

    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attributes activated: true, activated_at: Time.zone.now
      user.activate
      log_in user
      flash[:success] = t ".Account_activated"
      redirect_to user
    else
      flash[:danger] = t ".activation_link"
      redirect_to root_url
    end
  end
end
