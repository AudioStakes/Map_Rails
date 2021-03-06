Rails.application.routes.draw do
  resources :hokkaido,   only: [:edit, :update]
  root 'hokkaido#index'
  get 'hokkaido/hokkaido_map'
  get 'hokkaido/hokkaido_value'
  
  get "hokkaido/edit2" => 'hokkaido#edit2'
  post "hokkaido/edit2" => 'hokkaido#edit2'
  patch "hokkaido/edit2" => 'hokkaido#edit2'
  post "hokkaido/update" => 'hokkaido#update'
  patch "hokkaido/update" => 'hokkaido#update'
  
  get "hokkaido/info" => 'hokkaido#info'
  post "hokkaido/info" => 'hokkaido#info'
  
  get 'hokkaido/show/:id' => 'hokkaido#show'
  get "hokkaido/move_show" => 'hokkaido#move_show'
  post "hokkaido/move_show" => 'hokkaido#move_show'
  
  get "hokkaido/csv" => 'hokkaido#csv'
  
  get "hokkaido/search" => 'hokkaido#search'
  
  get "hokkaido/move_edit" => 'hokkaido#move_edit'
  post "hokkaido/move_edit" => 'hokkaido#move_edit'
  
  get "hokkaido/select_bureau" => 'hokkaido#select_bureau'
  post "hokkaido/select_bureau" => 'hokkaido#select_bureau'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
