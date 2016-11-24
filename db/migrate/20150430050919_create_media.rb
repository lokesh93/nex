class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :owner_id
      t.string :owner_type

      t.timestamps null: false
    end
  end
end
