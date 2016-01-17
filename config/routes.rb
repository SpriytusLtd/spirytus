Rails.application.routes.draw do

  devise_for :stores, controllers: {
    sessions:      'stores/sessions',
    passwords:     'stores/passwords',
    registrations: 'stores/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'indexes#index'

  resources :drinks, controller: 'drinks/indexes', only: [ :index, :create, :new, :edit, :show, :update, :destroy ] do
    resources :reviews, controller: 'drinks/reviews', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resources :favorites, controller: 'drinks/favorites', only: [ :create, :destroy ]
  end

  resources :stores, controller: 'stores/indexes', only: [ :index, :show ] do
    resources :reviews, controller: 'stores/reviews', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resources :favorites, controller: 'stores/favorites', only: [ :create ]
    delete 'favorites' => 'stores/favorites#destroy'
    resources :configurations, controller: 'stores/configurations', only: [ :index, :create, :new ]
  end

  resources :users, controller: 'users/indexes', only: [ :show ] do
    resources :reviews, controller: 'users/reviews', only: [ :index, :show, :destroy ]
    resources :favorites, controller: 'users/favorites', only: [ :index ]
    resources :configurations, controller: 'users/configurations', only: [ :index, :create, :new, :destroy ]
  end

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
