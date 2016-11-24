class OptionsCityList < ActiveRecord::Base
  belongs_to :location_option
  belongs_to :city
end
