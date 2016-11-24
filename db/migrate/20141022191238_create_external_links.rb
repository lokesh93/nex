class CreateExternalLinks < ActiveRecord::Migration
  def change
    create_table :external_links do |t|
      t.integer :vendor_id
      t.integer :external_source_id
      t.string :link

      t.timestamps
    end
  end
end
