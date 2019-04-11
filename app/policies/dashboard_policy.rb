class DashboardPolicy < ApplicationPolicy
  def show?
    user_logged_in?
  end
end
