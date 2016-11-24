json.array!(@bids) do |bid|
  json.extract! bid, :id, :value, :status, :info
  json.url bid_url(bid, format: :json)
end
