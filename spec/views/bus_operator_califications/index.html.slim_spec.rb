require 'rails_helper'

RSpec.describe "bus_operator_califications/index", type: :view do
  before(:each) do
    assign(:bus_operator_califications, [
      BusOperatorCalification.create!(
        :bus_operator => nil,
        :rating => 2,
        :comment => "MyText"
      ),
      BusOperatorCalification.create!(
        :bus_operator => nil,
        :rating => 2,
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of bus_operator_califications" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
