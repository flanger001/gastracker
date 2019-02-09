require "rails_helper"

RSpec.describe "General routes", type: :routing do
  it "routes root to PagesController" do
    expect(get("/")).to route_to "pages#index"
  end

  it "routes /about to PagesController" do
    expect(get("about")).to route_to("pages#about")
  end

  it "routes dashboard to to DashboardsController" do
    expect(get("dashboard")).to route_to("dashboards#show")
  end

  it "routes instructions to to DashboardsController" do
    expect(get("instructions")).to route_to("dashboards#instructions")
  end

  it "routes login and logout to  User::SessionsController" do
    expect(get("login")).to route_to("user/sessions#new")
    expect(get("logout")).to route_to("user/sessions#destroy")
  end

  it "routes account to to User::UsersController" do
    expect(get("account")).to route_to("user/users#show")
  end

  it "routes password/new and create to User::PasswordsController" do
    expect(get("password/new")).to route_to("user/passwords#new")
    expect(post("password")).to route_to("user/passwords#create")
  end

  it "routes direct session links to User::SessionsController" do
    expect(get("session/new")).to route_to("user/sessions#new")
    expect(post("session")).to route_to("user/sessions#create")
    expect(delete("session")).to route_to("user/sessions#destroy")
  end
end
