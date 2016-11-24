class ExternalSource < ActiveRecord::Base
  has_many :external_link, dependent: :destroy
end
