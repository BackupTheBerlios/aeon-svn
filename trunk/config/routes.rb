ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"
  
  map.login 'login',   :controller => 'users', :action => 'login'
  map.logout 'logout', :controller => 'users', :action => 'logout'

  map.appointments     'appointments',          :controller => 'appointments'
  map.new_appointment  'appointments/new',      :controller => 'appointments', :action => 'new'
  map.edit_appointment 'appointments/edit/:id', :controller => 'appointments', :action => 'edit'
  map.appointment      'appointments/show/:id', :controller => 'appointments', :action => 'show'

  map.clients      'clients',         :controller => 'clients'
  map.new_client  'clients/new',      :controller => 'clients', :action => 'new'
  map.edit_client 'clients/edit/:id', :controller => 'clients', :action => 'edit'
  map.client      'clients/show/:id', :controller => 'clients', :action => 'show'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
