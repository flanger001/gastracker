class PasswordResetFormPolicy < ApplicationPolicy
  def new?
    user_logged_in?
  end

  def create?
    new?
  end
end
