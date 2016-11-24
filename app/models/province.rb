class Province < ActiveRecord::Base
  has_many :cities, dependent: :destroy
  belongs_to :country
end
