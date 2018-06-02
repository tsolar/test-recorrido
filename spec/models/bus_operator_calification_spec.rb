require 'rails_helper'

RSpec.describe BusOperatorCalification, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:rating) }
  end

  describe "Relationships" do
    it { should belong_to(:bus_operator) }
  end
end
