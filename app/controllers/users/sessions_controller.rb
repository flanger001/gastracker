module Users
  class SessionsController < ApplicationController
    before_action :require_no_user, :except => :destroy

    def new; end

    def create
      user = User.find_by_email(resource_params[:email].strip)
      if user && user.authenticate(resource_params[:password])
        session[:user_id] = user.id
        flash[:success] = "Logged in!"
        redirect_to dashboard_path
      else
        flash[:error] = "Unable to log in. Please try again."
        redirect_to login_path
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, :success => "Logged out!"
    end

    private

    def resource_params
      params.require(:session).permit(:email, :password)
    end
  end
end
