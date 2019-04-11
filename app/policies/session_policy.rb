class SessionPolicy < ApplicationPolicy
  def new?
    !user_logged_in?
  end

  def create?
    new?
  end

  def destroy?
    user_logged_in?
  end
end
