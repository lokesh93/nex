class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :business_name
      t.text :business_description
      t.date :establish_date
      t.integer :tax_number
      t.boolean :shipping
      t.boolean :selling
      t.boolean :servicing
      t.boolean :verified, default: false
      t.timestamps
    end
  end
end
