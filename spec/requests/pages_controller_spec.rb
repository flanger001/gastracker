# frozen_string_literal: true

require "rails_helper"

RSpec.describe PagesController do
  describe "GET /" do
    it "should get index" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
