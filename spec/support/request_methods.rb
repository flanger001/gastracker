# frozen_string_literal: true

module RequestMethods
  def sign_in(user)
    post("/session", :params => { :session => { :email => user.email, :password => "p@ssw0rd" } })
  end
end
