class PostSubscription < ActiveRecord::Base
  belongs_to :post
  belongs_to :subcategory
  belongs_to :category
  validates :subcategory_id, presence: true, uniqueness: { scope: :post_id }
end
