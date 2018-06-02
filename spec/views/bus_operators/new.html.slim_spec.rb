require 'rails_helper'

RSpec.describe "bus_operators/new", type: :view do
  before(:each) do
    assign(:bus_operator, BusOperator.new(
      :internal_name => "MyString",
      :official_name => "MyString",
      :recorrido_id => 1,
      :average_rating => 1.5,
      :slug => "MyString",
      :icons => "MyText",
      :images => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new bus_operator form" do
    render

    assert_select "form[action=?][method=?]", bus_operators_path, "post" do

      assert_select "input[name=?]", "bus_operator[internal_name]"

      assert_select "input[name=?]", "bus_operator[official_name]"

      assert_select "input[name=?]", "bus_operator[recorrido_id]"

      assert_select "input[name=?]", "bus_operator[average_rating]"

      assert_select "input[name=?]", "bus_operator[slug]"

      assert_select "textarea[name=?]", "bus_operator[icons]"

      assert_select "textarea[name=?]", "bus_operator[images]"

      assert_select "textarea[name=?]", "bus_operator[description]"
    end
  end
end
