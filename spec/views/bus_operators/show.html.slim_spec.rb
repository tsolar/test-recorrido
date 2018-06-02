require 'rails_helper'

RSpec.describe "bus_operators/show", type: :view do
  before(:each) do
    @bus_operator = assign(:bus_operator, BusOperator.create!(
      :official_name => "Official Name",
      :recorrido_id => 2,
      :average_rating => 3.5,
      :description => "My Description"
    ))

    @bus_operator_calification = assign(
      :bus_operator_calification,
      BusOperatorCalification.new
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Official Name/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/My Description/)

    assert_select "form[action=?][method=?]", bus_operator_califications_path(bus_operator_id: @bus_operator.to_param), "post" do

      assert_select "select[name=?]", "bus_operator_calification[rating]"
      assert_select "textarea[name=?]", "bus_operator_calification[comment]"
    end

  end
end
