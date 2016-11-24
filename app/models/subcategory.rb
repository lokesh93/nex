class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :vendor_subscriptions, dependent: :destroy
  has_many :vendors, through: :vendor_subscriptions, dependent: :destroy
  has_many :post_subscriptions, dependent: :destroy
  has_many :posts , through: :posts, dependent: :destroy
end
