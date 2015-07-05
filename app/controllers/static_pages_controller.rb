class StaticPagesController < ApplicationController

  def index
    redirect_to home_path if user_logged_in?
  end

  def about
  end

end
