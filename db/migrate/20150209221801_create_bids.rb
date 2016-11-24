class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :value
      t.string :status , default: "bid-pending"
      t.text :info
      t.integer :user_id
      t.integer :post_id
      t.boolean :legacy, default: false
      t.timestamps null: false
    end
  end
end
