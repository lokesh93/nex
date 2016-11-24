class CreateAcceptedPaymentMethods < ActiveRecord::Migration
  def change
    create_table :accepted_payment_methods do |t|
      t.integer :vendor_id
      t.integer :post_id
      t.integer :payment_method_id
      t.boolean :preferred, default: false
      t.boolean :accepted, default: false
      t.timestamps null: false
    end
  end
end
