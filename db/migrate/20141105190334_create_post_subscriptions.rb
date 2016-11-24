class CreatePostSubscriptions < ActiveRecord::Migration
  def change
    create_table :post_subscriptions do |t|
      t.integer :post_id
      t.integer :subcategory_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
