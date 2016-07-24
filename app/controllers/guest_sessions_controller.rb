class GuestSessionsController < ApplicationController
  before_action :redirect_if_signed_in, only: [:create]

  def create
    user = User.find_by_email "guest@gmail.com"
    sign_in(user)
    redirect_to root_path, notice: "Signed in as a guest!"
  end

  private

  def redirect_if_signed_in
    redirect_to root_path, notice: "Already signed in as #{current_user.first_name}!" if user_signed_in?
  end
end
