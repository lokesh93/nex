class ServiceLocation < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :city
end
