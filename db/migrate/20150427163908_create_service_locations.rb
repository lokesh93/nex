class CreateServiceLocations < ActiveRecord::Migration
  def change
    create_table :service_locations do |t|
      t.integer :vendor_id
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
