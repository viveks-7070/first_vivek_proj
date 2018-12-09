class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.present?
      sign_in user
      flash[:notice] = "You have successfully logged out."
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
