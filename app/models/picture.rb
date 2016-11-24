class Picture < ActiveRecord::Base
	belongs_to :owner, polymorphic: true 
	
	has_attached_file :image, 
		:styles => {:user_image => "60x60>",:post_image => "180x191#", :max_image => "x500"},
		:path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
