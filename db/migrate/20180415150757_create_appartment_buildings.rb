class CreateAppartmentBuildings < ActiveRecord::Migration
  def change
    create_table :appartment_buildings do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
