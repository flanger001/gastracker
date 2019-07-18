# frozen_string_literal: true

class DashboardPolicy < ApplicationPolicy
  def show?
    user_logged_in?
  end
end
