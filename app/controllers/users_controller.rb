class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(resource_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "#{user.name}, your account has been created and you are now logged in!"
      redirect_to root_path
    else
      flash[:error] = 'Unable to create user. Please try again!'
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

  def password
  end

  private

  def resource_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user
    @user ||= User.find(params[:id])
  end

  helper_method :user

end
