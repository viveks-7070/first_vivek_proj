class SessionsController < ApplicationController

  def new

  end

  def create
    login = Login.authenticate(params[:session][:email], params[:session][:password])
    if login.present?
      sign_in login
      flash[:notice] = "You have successfully logged out."
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def destroy
    session[:login_id] = nil
    redirect_to new_session_path
  end
end
