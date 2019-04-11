class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery :with => :exception

  rescue_from Pundit::NotAuthorizedError, :with => :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
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
