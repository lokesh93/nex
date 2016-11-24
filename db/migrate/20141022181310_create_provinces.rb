class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.integer :country_id
      t.string :short_name
      t.timestamps
    end
  end
end
