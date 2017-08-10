class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    user = User.find_by(session_token: session[:session_token])
    return nil if user.nil?
    user
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
    current_user = user
  end

  def log_out_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_signed_in!
    redirect_to new_session_url unless logged_in?
  end

end
