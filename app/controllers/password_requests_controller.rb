class PasswordRequestsController < ApplicationController
  before_action :require_no_user

  def new
    authorize(password_request_form)
  end

  def create
    authorize(password_request_form)
    cookies.permanent[:require_password_reset] = password_request_form.user.id if password_request_form.submit(password_request_params)
    flash[:success] = "Please check your email for a password reset token."
    redirect_to root_path
  end

  private

  def password_request_form
    @password_request_form ||= PasswordRequestForm.new
  end

  helper_method :password_request_form

  def password_request_params
    params.require(:password_request).permit(:email)
  end
end
