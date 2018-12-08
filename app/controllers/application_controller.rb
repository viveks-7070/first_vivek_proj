class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user


  def sign_in user
    session[:user_id] = user.id
    self.current_user = user
  end

  def current_user=user
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end
end
