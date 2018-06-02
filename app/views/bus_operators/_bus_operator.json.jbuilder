json.extract! bus_operator, :id, :internal_name, :official_name, :recorrido_id, :average_rating, :slug, :icons, :images, :description, :created_at, :updated_at
json.url bus_operator_url(bus_operator, format: :json)
