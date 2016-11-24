class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.text :content
      t.string :fist_name
      t.string :last_name
      t.string :feedback_type

      t.timestamps null: false
    end
  end
end
