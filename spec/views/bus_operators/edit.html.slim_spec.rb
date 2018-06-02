require 'rails_helper'

RSpec.describe "bus_operators/edit", type: :view do
  before(:each) do
    @bus_operator = assign(:bus_operator, BusOperator.create!(
      :internal_name => "MyString",
      :official_name => "MyString",
      :recorrido_id => 1,
      :average_rating => 1.5,
      :slug => "MyString",
      :icons => "MyText",
      :images => "MyText",
      :description => ""
    ))
  end

  it "renders the edit bus_operator form" do
    render

    assert_select "form[action=?][method=?]", bus_operator_path(@bus_operator), "post" do

      assert_select "textarea[name=?]", "bus_operator[description]"
    end
  end
end
