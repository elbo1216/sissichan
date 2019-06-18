Sissichan2012::Application.routes.draw do
  devise_for :users, :skip => [:sessions]

  as :user do
    get    'signin'   => 'sessions#new',     :as => :new_user_session
    post   'signin'    => 'sessions#create',  :as => :user_session
    get    'signout'  => 'sessions#destroy', :as => :destroy_user_session
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   get 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   get 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  get '/photos/wedding', :controller => 'photos', :action => 'wedding'
  get '/photos/glamor', :controller => 'photos', :action => 'glamor'
  get '/booking_policy', :controller => 'rates', :action => 'booking_policy'
  get '/faq', :controller => 'rates', :action => 'faq'
  get '/contact/submit', :controller => 'contact', :action => 'submit'

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
  get '/admin', :controller => 'admin', :action => 'login'
  post '/admin', :controller => 'admin/faq', :action => 'index'
  get '/admin/photos/gallery', :controller => 'admin/photos', :action => 'gallery'
  post '/admin/photos/upload', :controller => 'admin/photos', :action => 'upload'
  post '/admin/photos/save_images', :controller => 'admin/photos', :action => 'save_images'
  post '/admin/photos/upload_tmp', :controller => 'admin/photos', :action => 'upload_tmp'
  post '/admin/photos/remove_tmp', :controller => 'admin/photos', :action => 'remove_tmp'
  post '/admin/photos/save_galleries', :controller => 'admin/photos', :action => 'save_galleries'
  get '/admin/photos/get_image', :controller => 'admin/photos', :action => 'get_image'
  post '/admin/photos/edit_image', :controller => 'admin/photos', :action => 'edit_image'
  post '/admin/photos/delete_image', :controller => 'admin/photos', :action => 'delete_image'
  get '/admin/services', :controller => 'admin/professional_services', :action => 'index'
  post '/admin/services/update_records', :controller => 'admin/professional_services', :action => 'update_records'
  get '/admin/reviews', :controller => 'admin/reviews', :action => 'index'
  post '/admin/reviews/add_update_review', :controller => 'admin/reviews', :action => 'add_update_review'
  post '/admin/reviews/deactivate', :controller => 'admin/reviews', :action => 'deactivate'
  get '/admin/press', :controller => 'admin/press', :action => 'index'
  get '/admin/press/manage', :controller => 'admin/press', :action => 'manage'
  post '/admin/press/add', :controller => 'admin/press', :action => 'add'
  post '/admin/press/update_positions', :controller => 'admin/press', :action => 'update_positions'
  post '/admin/press/update_url', :controller => 'admin/press', :action => 'update_url'
  get '/admin/booking_policy', :controller => 'admin/booking_policy', :action => 'index'
  get '/admin/contacts', :controller => 'admin/contacts', :action => 'index'
  get '/admin/contacts/search', :controller => 'admin/contacts', :action => 'search'
  get '/admin/contacts/away', :controller => 'admin/contacts', :action => 'away'
  get '/admin/contacts/chart', :controller => 'admin/contacts', :action => 'chart'
  get '/admin/about', :controller => 'admin/about', :action => 'index'
  get '/admin/faq', :controller => 'admin/faq', :action => 'index'
  post '/admin/faq/upsert', :controller => 'admin/faq', :action => 'upsert'
  post '/admin/faq/deactivate', :controller => 'admin/faq', :action => 'deactivate'
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
  # get ':controller(/:action(/:id(.:format)))'
end
