json.array!(@options_city_lists) do |options_city_list|
  json.extract! options_city_list, :id, :location_option_id, :city_id
  json.url options_city_list_url(options_city_list, format: :json)
end
