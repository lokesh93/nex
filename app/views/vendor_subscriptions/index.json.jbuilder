json.array!(@vendor_subscriptions) do |vendor_subscription|
  json.extract! vendor_subscription, :id, :vendor_id, :subcategory_id
  json.url vendor_subscription_url(vendor_subscription, format: :json)
end
