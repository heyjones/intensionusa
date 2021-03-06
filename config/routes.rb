Intensionusa::Application.routes.draw do


  resources :sizes

  resources :metafields do
  	resources :values, :shallow => true
  end

  resources :categories do
 	 resources :sizes, :shallow => true
# 	 resources :subcategories, :shallow => true
  end

  resources :materials

  resources :makes
  resources :models do
  	resources :model_products
  end
  get 'makes/:id/models' => 'models#make'

  get 'products' => 'products#index'
  get 'products/:id' => 'products#show'
  post 'products/:id' => 'products#update'

  get 'shopify/product-types' => 'shopify#product_types'
  get 'shopify/:product_type/products' => 'shopify#product_type_products'
  get 'shopify/products' => 'shopify#products'
  get 'shopify/:id/product' => 'shopify#product'
  post 'shopify/:id/product/variant' => 'shopify#product_variant'
  get 'shopify/:product_type/metafields' => 'shopify#metafields'
  get 'shopify/savings-calculator' => 'shopify#savings_calculator'
  get 'shopify/find-your-wheelset' => 'shopify#find_your_wheelset'
  get 'shopify/wheel-customizer' => 'shopify#wheel_customizer'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

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
