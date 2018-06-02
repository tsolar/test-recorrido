class BusOperator < ApplicationRecord
  serialize :icons
  serialize :images

  def to_s
    official_name
  end

  def self.load_from_recorrido
    # begin
      bus_operators_response = HTTParty.get("https://www.recorrido.cl/api/v2/es/bus_operators.json")
      bus_operators_parsed_response = JSON.parse(bus_operators_response.body)
      bus_operators_from_recorrido = bus_operators_parsed_response["bus_operators"]

      bus_operators_from_recorrido.each do |bus_operator|
        unless BusOperator.exists?(recorrido_id: bus_operator["id"])
          BusOperator.create(
            recorrido_id: bus_operator["id"],
            official_name: bus_operator["official_name"],
            icons: bus_operator["icons"],
            images: bus_operator["images"],
            average_rating: bus_operator["average_rating"],
            slug: bus_operator["slug"]
          )
        end
      end
      all.order(official_name: :asc)
    # rescue
      # self.all
    # end
  end
end
