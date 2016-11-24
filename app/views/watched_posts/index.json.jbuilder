json.array!(@watched_posts) do |watched_post|
  json.extract! watched_post, :id, :user_id, :post_id
  json.url watched_post_url(watched_post, format: :json)
end
