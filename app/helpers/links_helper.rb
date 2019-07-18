# frozen_string_literal: true

module LinksHelper
  NavLink = Struct.new(:name, :url, :method)

  def nav_links
    @nav_links = [
      ["Home", root_path],
      ["About", about_path],
    ]
    logged_in = [
      ["Stations", stations_path],
      ["Vehicles", vehicles_path],
      [current_user.name, user_path],
      ["Log Out", logout_path]
    ]
    logged_out = [
      ["Sign Up", new_user_path],
      ["Log In", login_path],
    ]
    @nav_links.concat(user_logged_in? ? logged_in : logged_out)
    @nav_links.map { |link| NavLink.new(*link) }
  end

  def nav_tabs
    @nav_tabs = [
      ["Dashboard", dashboard_path],
      ["All Stations", stations_path],
      ["All Vehicles", vehicles_path],
      ["Instructions", instructions_path],
    ]
    @nav_tabs.map { |tab| NavLink.new(*tab) }
  end

  def vehicle_links
    @vehicle_links ||= {
      "All Vehicles" => vehicles_path,
      "Add A Vehicle" => new_vehicle_path,
    }
    @vehicle_links.map { |link| NavLink.new(*link) }
  end

  def station_links
    @station_links ||= {

    }
  end
end
