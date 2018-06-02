require "rails_helper"

RSpec.describe BusOperatorCalificationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/bus_operators/1/califications").to route_to("bus_operator_califications#index", bus_operator_id: "1")
    end

    it "routes to #create" do
      expect(post: "/bus_operators/1/califications").to route_to("bus_operator_califications#create", bus_operator_id: "1")
    end
  end
end
