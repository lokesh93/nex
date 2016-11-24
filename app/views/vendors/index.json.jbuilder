json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :business_name, :business_description, :establish_date, :tax_number, :shipping, :verified
  json.url vendor_url(vendor, format: :json)
end
