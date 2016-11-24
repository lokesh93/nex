class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :owner, polymorphic: true
      t.timestamps
    end
  end
end
