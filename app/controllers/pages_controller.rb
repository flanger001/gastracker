# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    redirect_to(dashboard_path) if user_logged_in?
  end
end
