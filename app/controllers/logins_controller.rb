class LoginsController < ApplicationController
  def index
  end
  def new
    @login = Login.new
  end

  def create
    @login = Login.new(login_params)
    message = ''
    if login_params[:name].blank? || login_params[:email].blank? || login_params[:password].blank? || login_params[:password_confirmation].blank?
      message = 'not valid'
    end
    if @login.valid? && message.blank?
      @login.save
      redirect_to logins_path
    else
      render 'new'
    end
  end

  private

  def login_params
    params.require(:login).permit(:name, :email, :password, :password_confirmation)
  end
end
