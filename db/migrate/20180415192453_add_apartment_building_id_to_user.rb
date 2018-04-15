class AddApartmentBuildingIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :apartment_building_id, :integer
  end
end
