require 'rails_helper'

RSpec.describe "bus_operators/index", type: :view do
  before(:each) do
    assign(:bus_operators, [
      BusOperator.create!(
        :internal_name => "Internal Name",
        :official_name => "Official Name",
        :recorrido_id => 2,
        :average_rating => 3.5,
        :slug => "Slug",
        :icons => "MyText",
        :images => "MyText",
        :description => "MyText"
      ),
      BusOperator.create!(
        :internal_name => "Internal Name",
        :official_name => "Official Name",
        :recorrido_id => 2,
        :average_rating => 3.5,
        :slug => "Slug",
        :icons => "MyText",
        :images => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of bus_operators" do
    render
    assert_select "tr>td", :text => "Internal Name".to_s, :count => 2
    assert_select "tr>td", :text => "Official Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
