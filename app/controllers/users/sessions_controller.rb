module Users
  class SessionsController < ApplicationController
    before_action :require_no_user, :except => :destroy

    def new
      authorize(:session, :new?)
    end

    def create
      authorize(:session, :create?)
      user = User.find_by(:email => resource_params[:email].strip)
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
      authorize(:session, :destroy?)
      session[:user_id] = nil
      flash[:success] = "Logged out!"
      redirect_to root_path
    end

    private

    def resource_params
      params.require(:session).permit(:email, :password)
    end
  end
end
