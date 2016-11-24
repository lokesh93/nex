
class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :owner, polymorphic: true
      t.timestamps null: false
      t.string :embedded_id 
    end
  end
end
