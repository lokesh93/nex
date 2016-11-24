class LocationOption < ActiveRecord::Base
  has_many :delivery_locations, dependent: :destroy
  has_many :options_city_lists
  has_many :cities, through: :options_city_lists
end
