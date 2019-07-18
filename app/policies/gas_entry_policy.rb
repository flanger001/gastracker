# frozen_string_literal: true

class GasEntryPolicy < ApplicationPolicy
  def initialize(user, record)
    raise Pundit::NotAuthorizedError unless user.persisted?
    super
  end

  def index?
    true
  end

  def show?
    user.gas_entries.include?(record)
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
