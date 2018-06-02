require 'rails_helper'

RSpec.describe "bus_operators/show", type: :view do
  before(:each) do
    @bus_operator = assign(:bus_operator, BusOperator.create!(
      :internal_name => "Internal Name",
      :official_name => "Official Name",
      :recorrido_id => 2,
      :average_rating => 3.5,
      :slug => "Slug",
      :icons => "MyText",
      :images => "MyText",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Internal Name/)
    expect(rendered).to match(/Official Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
