module Users
  class UsersController < ApplicationController
    before_action :require_user, :except => [:new, :create]

    def show; end

    def new
      @user = User.new
    end

    def edit; end

    def create
      @user = User.new(resource_params)
      if user.save
        UserMailer.welcome(user).deliver_now
        session[:user_id] = user.id
        flash[:success] = "#{user.name}, your account has been created and you are now logged in!"
        redirect_to root_path
      else
        flash[:error] = "Unable to create user. Please try again!"
        render :new
      end
    end

    def update
      if user.update(resource_params)
        flash[:success] = "#{user.name}, your account has been updated!"
        redirect_to user_path(user)
      else
        render :edit
      end
    end

    def destroy
      if user.destroy
        session[:user_id] = nil
        flash[:success] = "Your account has been deleted along with all data associated with it."
      else
        session[:user_id] = nil
        flash[:error] = "There was a problem deleting your account, but you have been logged out."
      end
      redirect_to root_path
    end

    private

    def resource_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user
      @user ||= current_user
    end

    helper_method :user
  end
end
