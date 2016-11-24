class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.integer :owner_id
      t.string :owner_type
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
