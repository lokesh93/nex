class City < ActiveRecord::Base
  belongs_to :province
  has_many :posts
  has_many :option_city_lists, dependent: :destroy
  has_many :location_options, through: :option_city_lists
  has_many :delivery_locations, dependent: :destroy
  has_many :service_locations, dependent: :destroy
  has_many :physical_locations, dependent: :destroy
  has_many :vendors, through: :physical_locations
  has_many :consumers
end
