class CreateVendorSubscriptions < ActiveRecord::Migration
  def change
    create_table :vendor_subscriptions do |t|
      t.integer :vendor_id
      t.integer :subcategory_id
      t.timestamps
    end
  end
end
