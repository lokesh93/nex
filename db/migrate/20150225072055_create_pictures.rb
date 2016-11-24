class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :owner_id
      t.string :owner_type
      t.attachment :image

      t.timestamps null: false
    end
  end
end
