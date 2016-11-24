class CreateDeliveryLocations < ActiveRecord::Migration
  def change
    create_table :delivery_locations do |t|
      t.integer :vendor_id
      t.integer :city_id
      t.timestamps
    end
  end
end
