Rails.application.routes.draw do

  resources :cities

  resources :attachments do
    collection do
      get :add_attachment_to_form
    end
  end

  resources :assets

  resources :feedbacks

  resources :options_city_lists

  resources :location_options

  resources :galleries

  resources :media

  resources :reviews

  resources :service_locations

  resources :watched_posts

  resources :messages

  resources :conversations

  resources :authentications
  get '/auth/:provider/callback' => 'authentications#create'
  get '/auth/:provider/' => 'authentications#create', :as => :auth

  resources :bids do
    member do
      get :accept
      get :decline
    end
  end

  resources :comments

  get 'notification_settings' => 'email_notification_settings#index', :as => :notification_settings

  get 'change_status' => 'bids#change_status', :as => :change_status
  resources :timed_tasks

  resources :email_notification_settings

  resources :activities
  resources :personal_infos

  resources :posts do
    member do 
      get :activate_post
      get :all_bids
    end
  end

  get 'pages/home'
  get 'admin' => 'pages#admin', :as => "admin"
  get 'forgotten_password' => 'pages#forgotten_password', :as => :forgotten_password
  post 'reset_password' => 'pages#reset_password', :as => :reset_password
  # get 'activate_post' => 'post#activate_post', :as => :activate_post
  resources :consumers

  match 'fetch_categories' => 'api#fetch_categories', as: :fetch_categories, via: [:get, :post]
  match 'fetch_subcategories' => 'api#fetch_subcategories', as: :fetch_subcategories, via: [:get, :post]
  match 'fetch_cities' => 'api#fetch_cities', as: :fetch_cities, via: [:get, :post]
  match 'fetch_provinces' => 'api#fetch_provinces', as: :fetch_provinces, via: [:get, :post]
  match 'fetch_subcategory' => 'api#fetch_subcategory', as: :fetch_subcategory, via: [:get, :post]

  resources :vendors

  resources :users do
    member do
      get :show_account
      get :overview
      get :inbox
      get :bids
      get :statistics
      get :profile
      get :account
      get :watched_posts
      get :read
      get :manage_posts
    end
  end
  resources :user_sessions, only: [:new, :create]
  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
