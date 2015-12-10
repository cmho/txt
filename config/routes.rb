Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'page/:page/' => 'home#index'

  get 'login' => 'session#new', as: :login
  get 'logout' => 'session#destroy', as: :logout
  post 'login' => 'session#create'

  get 'register' => 'user#new', as: :register
  post 'register' => 'user#create'

  get 'u/:username' => 'user#show', as: :user
  get 'u/:username/following' => 'user#following', as: :user_following
  get 'u/:username/followed_by' => 'user#followed', as: :user_followed_by
  post 'u/:username/follow' => 'user#follow', as: :user_follow
  post 'u/:username/unfollow' => 'user#unfollow', as: :user_unfollow

  get 'settings' => 'user#edit', as: :settings
  post 'settings' => 'user#update'

  

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
