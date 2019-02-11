class UserMailer < ApplicationMailer
  default :from => "Gas Tracker <dave.shaffer@gmail.com>"

  def welcome(user)
    @user = user
    mail :to => @user.email, :subject => "Thank you for signing up for Gas Tracker"
  end
end
