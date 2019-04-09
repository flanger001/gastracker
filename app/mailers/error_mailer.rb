class ErrorMailer < ApplicationMailer
  default :from => ENV["ADMIN_EMAIL"]

  def notify_admin(request, response, error, current_user)
    @request = request
    @response = response
    @error = error
    @current_user = current_user
    mail :to => ENV["ADMIN_EMAIL"], :subject => "Problem on gas.daveshaffer.com"
  end
end
