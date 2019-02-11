module Users
  class PasswordsController < ApplicationController
    before_action :require_user

    def new; end

    def create
      if password_form.submit(params[:password_form])
        redirect_to user_path, :notice => "Successfully changed password"
      else
        render :new
      end
    end

    private

    def password_form
      @password_form ||= PasswordForm.new(current_user)
    end

    helper_method :password_form
  end
end
