class PaymentMethod < ActiveRecord::Base
  has_many :accepted_payment_methods
  has_many :vendors, through: :accepted_payment_methods
end
