require 'rails_helper'

RSpec.describe "BusOperators", type: :request do
  describe "GET /bus_operators" do
    it "works! (now write some real specs)" do
      get bus_operators_path
      expect(response).to have_http_status(200)
    end
  end
end
