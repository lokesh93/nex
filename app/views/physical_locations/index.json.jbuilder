json.array!(@physical_locations) do |physical_location|
  json.extract! physical_location, :id, :address, :postal_code, :business_phone, :other_phone, :fax, :business_email, :business_website, :sale_location, :city_id, :vendor_id
  json.url physical_location_url(physical_location, format: :json)
end
