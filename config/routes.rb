Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get '/about' => 'welcome#about', as: 'about'
  get '/vendors/followers' => 'vendors#followers', as: 'followers'
  resources :sessions, only: [:new]

  get '/login' => 'sessions#new'
  post '/login_user' => 'sessions#user_create'

  get '/login' => 'sessions#new'
  post '/login_vendor' => 'sessions#vendor_create'
  delete '/logout' => 'sessions#destroy'

  resources :vendors
  resources :deals do
    resources :purchased_items, only: [:new, :create]
  end
  resources :user


  get '/vendors/:id/text' => 'vendors#send_sms', as: 'text'
  get '/vendors/:id/email' => 'vendors#email_followers', as: 'email'
  put '/vendors/:id/follow' => 'vendors#follow', as: 'follow'
  delete '/vendors/:id/unfollow' => 'vendors#unfollow', as: 'unfollow'
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
  resources :charges
end
