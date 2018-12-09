class UsersController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    message = ''
    if user_params[:name].blank? || user_params[:email].blank? || user_params[:password].blank? || user_params[:password_confirmation].blank?
      message = 'not valid'
    end
    if @user.valid? && message.blank?
      @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
