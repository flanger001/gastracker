class ApplicationController < ActionController::Base
  before_action :set_raven_context
  before_action :force_password_reset

  include Pundit

  protect_from_forgery :with => :exception

  rescue_from Pundit::NotAuthorizedError, :with => :user_not_authorized

  private

  def set_raven_context
    Raven.user_context(:id => session[:user_id])
    Raven.extra_context(:params => params.to_unsafe_h, :url => request.url)
  end

  def force_password_reset
    return unless current_user.persisted?
    if cookies[:require_password_reset] == current_user.id.to_s
      flash[:error] = "You are required to reset your password."
      redirect_to new_password_reset_path
    end
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def current_user
    @current_user ||= User.from_session(session)
  end

  def user_logged_in?
    current_user.persisted?
  end

  def require_user
    redirect_to root_path if current_user.guest?
  end

  def require_no_user
    redirect_to root_path unless current_user.guest?
  end

  def resource
    raise "define a `resource`"
  end

  def collection
    raise "define a `collection`"
  end

  helper_method :current_user, :user_logged_in?, :collection, :resource
end
