class ExternalLink < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :external_source
end
