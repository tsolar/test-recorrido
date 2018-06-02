require 'rails_helper'

RSpec.describe BusOperator, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:official_name) }
    it { should validate_presence_of(:recorrido_id) } # this is the id from the API
    # it { should serialize(:icons) }
    # it { should serialize(:images) }
  end

  describe "#to_s" do
    it "should return official name" do
      bo = FactoryBot.create(:bus_operator)
      expect("#{bo}").to eq bo.official_name
    end
  end

  describe "Create" do
    it "should create a valid bus operator without description" do
      bo = FactoryBot.create(:bus_operator)
      expect(bo).to be_persisted
      expect(bo.description).to be_nil
    end

    it "should not create an invalid bus operator" do
      bo = FactoryBot.build(:bus_operator, :invalid)
      expect(bo).not_to be_valid
      expect(bo.save).to be false
      expect(bo).not_to be_persisted
    end
  end
end
