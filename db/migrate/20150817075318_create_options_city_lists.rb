class CreateOptionsCityLists < ActiveRecord::Migration
  def change
    create_table :options_city_lists do |t|
      t.integer :location_option_id
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
