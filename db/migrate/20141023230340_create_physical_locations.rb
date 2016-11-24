class CreatePhysicalLocations < ActiveRecord::Migration
  def change
    create_table :physical_locations do |t|
      t.string :address
      t.string :postal_code
      t.string :business_phone
      t.string :other_phone
      t.string :fax
      t.string :business_email
      t.string :business_website
      t.boolean :sale_location
      t.integer :city_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
