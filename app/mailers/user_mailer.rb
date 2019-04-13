class UserMailer < ApplicationMailer
  default :from => "Gas Tracker <#{ENV.fetch("SITE_EMAIL")}>"

  def welcome(user)
    @user = user
    mail :to => @user.email, :subject => "Thank you for signing up for Gas Tracker"
  end

  def password_request(user)
    @user = user
    mail :to => @user.email, :subject => "[Gas Tracker] Your password reset request"
  end
end
