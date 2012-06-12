ModENCODE::Application.routes.draw do
  resources :reagent_values
  resources :reagent_attributes
  resources :attempts
  resources :isoforms
  resources :pipelines
  resources :reagent_types
  resources :reagents do
    get :autocomplete_reagent_name, :on => :collection
  end
  resources :sessions, only: [:create, :destroy]
  resources :sources
  resources :statuses
  resources :steps
  resources :tags
  resources :aliases do
    get :autocomplete_alias_name, :on => :collection
  end
  match '/aliases/findTF' => 'aliases#findTF', :as => 'find_tfs'

  resources :transcription_factors do
    get :autocomplete_transcription_factor_name, :on => :collection
  end

  resources :users

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/feed', to: 'statuses#index'
  get "pages/dashboard"
  match '/dashboard', :to => 'pages#dashboard'
  get "pages/contact"
  match '/contact', :to => 'pages#contact'
  get "pages/completionProgress"

  root :to => 'pages#dashboard'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
