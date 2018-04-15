class CreateApartmentBuildings < ActiveRecord::Migration
  def change
    create_table :apartment_buildings do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
