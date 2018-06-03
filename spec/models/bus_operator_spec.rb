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

  describe ".load_from_recorrido" do
    let(:endpoint_url) {
      "https://www.recorrido.cl/api/v2/es/bus_operators.json"
    }
    let(:response_body) {
      File.read('spec/factories/bus_operators_response.json')
    }
    let(:response_body_with_a_new_one) {
      File.read('spec/factories/bus_operators_response_with_a_new_one.json')
    }
    let(:response_body_with_two_new_ones) {
      File.read('spec/factories/bus_operators_response_with_two_new_ones.json')
    }
    let(:response_stub) {
      stub_request(:get, endpoint_url).to_return(
        body: response_body,
        status: 200
      )
    }

    before :each do
      BusOperator.create(
        recorrido_id: 52, # the mock data uses id 52
        official_name: "Talca, Paris y Londres",
        average_rating: 4.3,
        icons: {
          bigger: "https://imagenes.recorrido.cl/logotipos/talca-paris-y-londres/logo/talca-paris-y-londres-logo-52.png?1473083365",
          medium: "https://imagenes.recorrido.cl/logotipos/talca-paris-y-londres/logo/talca-paris-y-londres-logo-52.png?1473083365",
          thumb: "https://imagenes.recorrido.cl/logotipos/talca-paris-y-londres/icono/talca-paris-y-londres-logo-52.png?1473083365",
          updated_at: "2016-09-05T10:49:25.472-03:00"
        },
        images: {
          mdpi: "https://imagenes.recorrido.cl/bus_operators/images/52/mdpi/TPL.png?1456154563",
          hdpi: "https://imagenes.recorrido.cl/bus_operators/images/52/hdpi/TPL.png?1456154563",
          xhdpi: "https://imagenes.recorrido.cl/bus_operators/images/52/xhdpi/TPL.png?1456154563",
          ios2x: "https://imagenes.recorrido.cl/bus_operators/images/52/ios2x/TPL.png?1456154563",
          ios3x: "https://imagenes.recorrido.cl/bus_operators/images/52/ios3x/TPL.png?1456154563",
          updated_at: "2016-02-22T12:22:43.284-03:00"
        }
      )

      # check the bus operator already exists
      expect(BusOperator.exists?(recorrido_id: 52)).to be true

      # load the stub
      response_stub
    end

    context "when response from endpoint is not a valid json" do
      let(:response_body) { "" }
      it "should not create any retrieved bus operators" do
        expect {
          BusOperator.load_from_recorrido
          # expect(bus_operators).to eq BusOperator.all.order(official_name: :asc)
        }.to change(BusOperator, :count).by(0)
      end

      it "returns all bus operators ordered by official_name" do
        bus_operators = BusOperator.load_from_recorrido
        expect(bus_operators).to eq BusOperator.all.order(official_name: :asc)
      end
    end

    context "when all bus operators are already saved locally" do
      it "should not create any retrieved bus operators" do
        expect {
          BusOperator.load_from_recorrido
        }.to change(BusOperator, :count).by(0)
      end

      it "returns all bus operators ordered by official_name" do
        bus_operators = BusOperator.load_from_recorrido
        expect(bus_operators).to eq BusOperator.all.order(official_name: :asc)
        expect(bus_operators.count).to eq 1 # only one is already saved
      end
    end

    context "when there's a new bus operator not saved locally" do
      let(:response_body) { response_body_with_a_new_one }
      it "should create only the new bus operator" do
        expect {
          BusOperator.load_from_recorrido
        }.to change(BusOperator, :count).by(1)

        last_bus_operator = BusOperator.last

        # check description is nil
        expect(last_bus_operator.description).to be_nil

        # check required attributes are present
        expect(last_bus_operator.official_name).to be_present
        expect(last_bus_operator.images).to be_present
        expect(last_bus_operator.icons).to be_present
        expect(last_bus_operator.recorrido_id).to be_present

        # the new one has no average_rating present
        expect(last_bus_operator.average_rating).to be_nil
      end

      it "returns all bus operators ordered by official_name" do
        bus_operators = BusOperator.load_from_recorrido
        expect(bus_operators).to eq BusOperator.all.order(official_name: :asc)
        expect(bus_operators.count).to eq 2 # one already saved + one new
      end
    end

    context "when there's two new bus operators not saved locally" do
      let(:response_body) { response_body_with_two_new_ones }
      it "should create tow new bus operators" do
        expect {
          BusOperator.load_from_recorrido
        }.to change(BusOperator, :count).by(2)

        last_bus_operators = BusOperator.last(2)

        # check description is nil
        expect(last_bus_operators.first.description).to be_nil
        expect(last_bus_operators.last.description).to be_nil

        # check required attributes are present
        expect(last_bus_operators.first.official_name).to be_present
        expect(last_bus_operators.last.official_name).to be_present
        expect(last_bus_operators.first.images).to be_present
        expect(last_bus_operators.last.images).to be_present
        expect(last_bus_operators.first.icons).to be_present
        expect(last_bus_operators.last.icons).to be_present
        expect(last_bus_operators.first.recorrido_id).to eq 247
        expect(last_bus_operators.last.recorrido_id).to eq 240

        # only one has average_rating present
        expect(last_bus_operators.first.average_rating).to be_nil
        expect(last_bus_operators.last.average_rating).to eq 3.2
      end

      it "returns all bus operators ordered by official_name" do
        bus_operators = BusOperator.load_from_recorrido
        expect(bus_operators).to eq BusOperator.all.order(official_name: :asc)
        expect(bus_operators.count).to eq 3 # one already saved + two new
      end
    end
  end
end
