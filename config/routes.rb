IssueTracking::Application.routes.draw do
  devise_for :staffs

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  match "home/new_ticket" => "home#new_ticket", :as => :new_ticket
  match "home/create_ticket" => "home#create_ticket", :as => :create_ticket
  match "home/ticket_history" => "home#ticket_history", :as => :ticket_history

  match "management/unassigned" => "management#unassigned", :as => :staff_root
  match "management/opened" => "management#opened", :as => :open_tickets
  match "management/on_hold" => "management#on_hold", :as => :on_hold_tickets
  match "management/closed" => "management#closed", :as => :closed_tickets

  match "management/view_ticket" => "management#view_ticket", :as => :view_ticket
  match "management/reply_ticket" => "management#reply_ticket", :as => :reply_ticket
  match "management/search_tickets" => "management#search_tickets", :as => :search_tickets



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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
