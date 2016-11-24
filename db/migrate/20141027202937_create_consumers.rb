class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.timestamps
      t.integer :city_id
    end
  end
end
