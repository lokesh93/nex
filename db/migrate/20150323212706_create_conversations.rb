class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :subject
      t.date :last_msg
      t.boolean :read_all_msgs, :default => false
      t.timestamps null: false

    end
  end
end
