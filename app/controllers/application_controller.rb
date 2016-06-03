class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= begin
      if session[:user_id]
        User.find(session[:user_id])
      else
        GuestUser.new
      end
    end
  end

  def user_logged_in?
    current_user.persisted?
  end

  def home_path
    user_logged_in? ? dashboards_path : root_path
  end

  def require_user
    redirect_to home_path if current_user.guest?
  end

  def require_no_user
    redirect_to home_path unless current_user.guest?
  end

  def resource
    raise 'define a `resource`'
  end

  def collection
    raise 'define a `collection`'
  end


  helper_method :current_user, :user_logged_in?, :home_path, :collection, :resource
end
