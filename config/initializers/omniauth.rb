Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
    provider :facebook, '944888442190787', '5e2f5fdc404fea6de69e73d1c172b9e6'
    # Mention other providers here you want to allow user to sign in with
end