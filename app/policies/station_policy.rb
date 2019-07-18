# frozen_string_literal: true

class StationPolicy < ApplicationPolicy
  def index?
    show?
  end

  def new?
    create?
  end

  def show?
    create?
  end

  def edit?
    update?
  end

  def update?
    false
  end

  def create?
    user_logged_in?
  end

  def destroy?
    update?
  end
end
