Sissichan2012::Application.routes.draw do
  devise_for :users, :skip => [:sessions]

  as :user do
    get    'signin'   => 'sessions#new',     :as => :new_user_session
    post   'signin'    => 'sessions#create',  :as => :user_session
    delete 'signout'  => 'sessions#destroy', :as => :destroy_user_session
    get    'signout'  => 'sessions#destroy', :as => :destroy_user_session
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  match '/photos/wedding', :controller => 'photos', :action => 'wedding' 
  match '/photos/glamor', :controller => 'photos', :action => 'glamor' 
  match '/booking_policy', :controller => 'rates', :action => 'booking_policy' 
  match '/faq', :controller => 'rates', :action => 'faq' 
  match '/contact/submit', :controller => 'contact', :action => 'submit' 

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resources :main
  resources :about
  resources :rates
  resources :reviews
  resources :press
  resources :contact
  resources :photos

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
  match '/admin', :controller => 'admin', :action => 'login'
  match '/admin/photos/gallery', :controller => 'admin/photos', :action => 'gallery' 
  match '/admin/photos/upload', :controller => 'admin/photos', :action => 'upload' 
  match '/admin/photos/save_images', :controller => 'admin/photos', :action => 'save_images' 
  match '/admin/photos/upload_tmp', :controller => 'admin/photos', :action => 'upload_tmp' 
  match '/admin/photos/remove_tmp', :controller => 'admin/photos', :action => 'remove_tmp' 
  match '/admin/photos/save_galleries', :controller => 'admin/photos', :action => 'save_galleries' 
  match '/admin/photos/get_image', :controller => 'admin/photos', :action => 'get_image' 
  match '/admin/photos/edit_image', :controller => 'admin/photos', :action => 'edit_image' 
  match '/admin/photos/delete_image', :controller => 'admin/photos', :action => 'delete_image' 
  match '/admin/services', :controller => 'admin/professional_services', :action => 'index' 
  match '/admin/services/update_records', :controller => 'admin/professional_services', :action => 'update_records' 
  match '/admin/reviews', :controller => 'admin/reviews', :action => 'index' 
  match '/admin/reviews/add_update_review', :controller => 'admin/reviews', :action => 'add_update_review' 
  match '/admin/reviews/deactivate', :controller => 'admin/reviews', :action => 'deactivate' 
  match '/admin/press', :controller => 'admin/press', :action => 'index' 
  match '/admin/press/manage', :controller => 'admin/press', :action => 'manage' 
  match '/admin/press/add', :controller => 'admin/press', :action => 'add' 
  match '/admin/press/update_positions', :controller => 'admin/press', :action => 'update_positions' 
  match '/admin/press/update_url', :controller => 'admin/press', :action => 'update_url' 
  match '/admin/contacts', :controller => 'admin/contacts', :action => 'index' 
  match '/admin/contacts/search', :controller => 'admin/contacts', :action => 'search' 
  match '/admin/contacts/away', :controller => 'admin/contacts', :action => 'away' 
  match '/admin/contacts/chart', :controller => 'admin/contacts', :action => 'chart' 
  match '/admin/about', :controller => 'admin/about', :action => 'index' 
  match '/admin/faq', :controller => 'admin/faq', :action => 'index'
  match '/admin/faq/upsert', :controller => 'admin/faq', :action => 'upsert'
  match '/admin/faq/deactivate', :controller => 'admin/faq', :action => 'deactivate'
  namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
    resources :photos
    resources :professional_services
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "main#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
