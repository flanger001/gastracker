class ErrorsController < ApplicationController
  def render(*args, &block)
    super "error", *args, &block
  end

  def not_found
    @message = "The resource you are trying to reach cannot be found."
    ErrorMailer.notify_admin(request, 404, "not found", current_user).deliver_now
    render :status => 404
  end

  def internal_server_error
    @message = "There was an error processing this request."
    ErrorMailer.notify_admin(request, 500, "internal server error", current_user).deliver_now
    render :status => 500
  end
end
