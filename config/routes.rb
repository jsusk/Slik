Slik::Application.routes.draw do


	root :to => "sessions#new"
	
  get "requests/index"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "session_error" => "sessions#session_error", :as => "session_error"
  resources :users
  resources :sessions
  resources :notifications
  resources :reports do
    collection do
      get "mensual"
      get "diario"
      get "corte_diario"
      get "corte_mensual"
    end
  end
  resources :orders do
    collection do
      get "search_suppliers"
    end
  end


  #get "products/index"
	resources :products do
    collection do
      get 'search_on_product'
    end
  end
	
  resources :e_combos do
    collection do
      get 'search_on_p_and_c'
      get 'search_on_p'
    end
  end

  resources :suppliers
  
  resources :d_sales

  resources :e_sales

  resources :requests do
    collection do
      post 'complete_request'
      post 'send_request'
      get 'index_alm'

    end
  end 

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
