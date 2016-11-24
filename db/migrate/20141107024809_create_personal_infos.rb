class CreatePersonalInfos < ActiveRecord::Migration
  def change
    create_table :personal_infos do |t|
      t.string :legal_first_name
      t.string :legal_last_name
      t.string :preferred_name
      t.string :email
      t.string :title
      t.integer :primary_phone
      t.integer :secondary_phone
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
