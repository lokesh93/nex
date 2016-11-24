class AddActiveToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :active, :boolean
  end
end
