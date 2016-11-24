class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :raiting
      t.text :feedback
      t.integer :user_id
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
