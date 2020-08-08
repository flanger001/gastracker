# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default :from => "Gas Tracker <#{Rails.application.credentials[:site_email]}>"

  def welcome(user)
    @user = user
    mail :to => @user.email, :subject => "Thank you for signing up for Gas Tracker"
  end

  def password_request(user)
    @user = user
    mail :to => @user.email, :subject => "[Gas Tracker] Your password reset request"
  end
end
