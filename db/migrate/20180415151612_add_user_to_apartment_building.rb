class AddUserToApartmentBuilding < ActiveRecord::Migration
  def change
    add_reference :apartment_buildings, :user, index: true, foreign_key: true
  end
end
