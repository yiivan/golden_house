class UsersController < ApplicationController
  before_action :redirect_if_signed_in

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:username, :first_name, :last_name, :email,
                                               :password, :password_confirmation)
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "Account created!"
    else
      flash.now[:alert] = "Account not created! Missing fields!"
      render :new
    end
  end
end

private

def redirect_if_signed_in
  if user_signed_in?
    redirect_to session[:my_previous_url], notice: "Signed in as #{current_user.first_name}!"
    session[:my_previous_url] = ""
  end
end
