class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user


  def sign_in login
    session[:login_id] = login.id
    self.current_user = login
  end

  def current_user=login
    @current_user = login
  end

  def current_user
    @current_user ||= Login.find(session[:login_id])
  end

  def sign_out
    session[:login_id] = nil
    self.current_user = nil
  end
end
