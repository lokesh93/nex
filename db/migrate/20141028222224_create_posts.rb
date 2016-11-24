class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :status, :default => "active"
      t.date :due_date
      t.boolean :phone_contact
      t.boolean :email_contact  
      t.boolean :delivery_needed
      t.boolean :service_needed
      t.boolean :pick_up_needed
      t.string :other_needed_string 
      t.boolean  :other_needed
      t.timestamps
    end
  end
end
