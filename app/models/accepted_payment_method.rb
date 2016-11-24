class AcceptedPaymentMethod < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :payment_method
  validates :payment_method_id, presence: true, uniqueness: {scope: :vendor_id}
  private

end
