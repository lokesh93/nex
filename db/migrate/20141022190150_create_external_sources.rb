class CreateExternalSources < ActiveRecord::Migration
  def change
    create_table :external_sources do |t|
      t.string :source_type

      t.timestamps
    end
  end
end
