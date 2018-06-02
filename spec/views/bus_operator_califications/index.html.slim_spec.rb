require 'rails_helper'

RSpec.describe "bus_operator_califications/index", type: :view do
  let(:bus_operator) { FactoryBot.create(:bus_operator) }
  before(:each) do
    assign(
      :bus_operator_califications,
      FactoryBot.create_list(
        :bus_operator_calification,
        2,
        rating: 3,
        bus_operator_id: bus_operator.id
      )
    )
    assign(:bus_operator, bus_operator)
  end

  it "renders a list of bus_operator_califications" do
    render
    assert_select "ul li p span", :text => "3", :count => 2
    assert_select "ul li p span", :text => BusOperatorCalification.last.comment, :count => 1
    assert_select "ul li p span", :text => BusOperatorCalification.first.comment, :count => 1
  end
end
