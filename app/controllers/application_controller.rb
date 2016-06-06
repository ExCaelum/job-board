class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_error
  helper_method :current_user
  before_action :require_log_in

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user  && current_user.admin?
  end

  def require_log_in
    render file: '/public/error' unless current_user
  end

  def render_error
    render :error, locals: { error_message: "Invalid URL"}
  end

end
