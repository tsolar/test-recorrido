class CreateBusOperatorCalifications < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_operator_califications do |t|
      t.references :bus_operator, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
