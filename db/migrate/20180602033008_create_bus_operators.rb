class CreateBusOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_operators do |t|
      t.string :internal_name
      t.string :official_name
      t.integer :recorrido_id
      t.float :average_rating
      t.string :slug
      t.text :icons
      t.text :images
      t.text :description

      t.timestamps
    end
  end
end
