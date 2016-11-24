class Bid < ActiveRecord::Base

	belongs_to :post
	belongs_to :user

	def active?
		return(self.post.due_date.to_date > Time.now.to_date)
	end

  def content
    "Bid $#{self.value}. #{self.status}"
  end
end
