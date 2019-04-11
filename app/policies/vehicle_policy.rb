class VehiclePolicy < ApplicationPolicy
  def initialize(user, record)
    raise Pundit::NotAuthorizedError unless user.persisted?
    super
  end

  def index?
    true
  end

  def show?
    user.vehicles.include?(record)
  end

  def create?
    true
  end

  def destroy?
    show?
  end

  def update?
    show?
  end
end
