class ErrorsController < ApplicationController
  def render(*args, &block)
    Raven.capture_exception(request.env["action_dispatch.exception"])
    super "error", *args, &block
  end

  def not_found
    @message = "The resource you are trying to reach cannot be found."
    render :status => 404
  end

  def internal_server_error
    @message = "There was an error processing this request."
    render :status => 500
  end
end
