# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    authorize(:dashboard, :show?)
  end
end
