module Users
  class PasswordsController < ApplicationController
    before_action :require_user

    def new
      authorize(password_form)
    end

    def create
      authorize(password_form)

      if password_form.submit(password_params)
        flash[:success] = "Password successfully changed!"
        redirect_to user_path
      else
        render :new
      end
    end

    private

    def password_form
      @password_form ||= PasswordForm.new(current_user)
    end

    def password_params
      params.require(:password_form).permit(
        :original_password,
        :new_password,
        :new_password_confirmation
      )
    end

    helper_method :password_form
  end
end
