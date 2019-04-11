class PasswordFormPolicy < ApplicationPolicy
  def new?
    user_logged_in? && record.user == user
  end

  def create?
    new?
  end
end
