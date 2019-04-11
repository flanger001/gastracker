class UserPolicy < ApplicationPolicy
  def show?
    user_logged_in? && user == record
  end

  def create?
    !user_logged_in?
  end

  def new?
    create?
  end

  def update?
    show?
  end

  def edit?
    update?
  end

  def destroy?
    show?
  end
end
