# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  before_action :find_user_from_token, :only => :new
  skip_before_action :force_password_reset

  def new
    authorize(password_reset_form)
  end

  def create
    authorize(password_reset_form)
    @password_reset_form = PasswordResetForm.new(current_user)

    if password_reset_form.submit(password_reset_params)
      session[:user_id] = nil
      flash[:success] = "Your password has been changed successfully. You may now login with your new password."
      redirect_to root_path
    else
      flash[:error] = "There was a problem with your submission. Please review the items below."
      render :new
    end
  end

  private

  def password_reset_form
    @password_reset_form ||= PasswordResetForm.new(current_user)
  end

  helper_method :password_reset_form

  def find_user_from_token
    user = User.joins(:password_request).where(:password_requests => { :token => params[:token] }).first || User.from_session(session)
    if user.persisted?
      session[:user_id] = user.id
    else
      redirect_to root_path
    end
  end

  def password_reset_params
    params.require(:password_reset).permit(:new_password, :new_password_confirmation)
  end
end
