# == Route Map
#
#                        Prefix Verb      URI Pattern                                   Controller#Action
#                    categories GET       /categories(.:format)                         categories#index
#                               POST      /categories(.:format)                         categories#create
#                  new_category GET       /categories/new(.:format)                     categories#new
#                 edit_category GET       /categories/:id/edit(.:format)                categories#edit
#                      category GET       /categories/:id(.:format)                     categories#show
#                               PATCH     /categories/:id(.:format)                     categories#update
#                               PUT       /categories/:id(.:format)                     categories#update
#                               DELETE    /categories/:id(.:format)                     categories#destroy
#                        brands GET       /brands(.:format)                             brands#index
#                               POST      /brands(.:format)                             brands#create
#                     new_brand GET       /brands/new(.:format)                         brands#new
#                    edit_brand GET       /brands/:id/edit(.:format)                    brands#edit
#                         brand GET       /brands/:id(.:format)                         brands#show
#                               PATCH     /brands/:id(.:format)                         brands#update
#                               PUT       /brands/:id(.:format)                         brands#update
#                               DELETE    /brands/:id(.:format)                         brands#destroy
#                       fabrics GET       /fabrics(.:format)                            fabrics#index
#                               POST      /fabrics(.:format)                            fabrics#create
#                    new_fabric GET       /fabrics/new(.:format)                        fabrics#new
#                   edit_fabric GET       /fabrics/:id/edit(.:format)                   fabrics#edit
#                        fabric GET       /fabrics/:id(.:format)                        fabrics#show
#                               PATCH     /fabrics/:id(.:format)                        fabrics#update
#                               PUT       /fabrics/:id(.:format)                        fabrics#update
#                               DELETE    /fabrics/:id(.:format)                        fabrics#destroy
#                         sizes GET       /sizes(.:format)                              sizes#index
#                               POST      /sizes(.:format)                              sizes#create
#                      new_size GET       /sizes/new(.:format)                          sizes#new
#                     edit_size GET       /sizes/:id/edit(.:format)                     sizes#edit
#                          size GET       /sizes/:id(.:format)                          sizes#show
#                               PATCH     /sizes/:id(.:format)                          sizes#update
#                               PUT       /sizes/:id(.:format)                          sizes#update
#                               DELETE    /sizes/:id(.:format)                          sizes#destroy
#                        colors GET       /colors(.:format)                             colors#index
#                               POST      /colors(.:format)                             colors#create
#                     new_color GET       /colors/new(.:format)                         colors#new
#                    edit_color GET       /colors/:id/edit(.:format)                    colors#edit
#                         color GET       /colors/:id(.:format)                         colors#show
#                               PATCH     /colors/:id(.:format)                         colors#update
#                               PUT       /colors/:id(.:format)                         colors#update
#                               DELETE    /colors/:id(.:format)                         colors#destroy
#                        images GET       /images(.:format)                             images#index
#                               POST      /images(.:format)                             images#create
#                     new_image GET       /images/new(.:format)                         images#new
#                    edit_image GET       /images/:id/edit(.:format)                    images#edit
#                         image GET       /images/:id(.:format)                         images#show
#                               PATCH     /images/:id(.:format)                         images#update
#                               PUT       /images/:id(.:format)                         images#update
#                               DELETE    /images/:id(.:format)                         images#destroy
#                     galleries GET       /galleries(.:format)                          galleries#index
#                               POST      /galleries(.:format)                          galleries#create
#                   new_gallery GET       /galleries/new(.:format)                      galleries#new
#                  edit_gallery GET       /galleries/:id/edit(.:format)                 galleries#edit
#                       gallery GET       /galleries/:id(.:format)                      galleries#show
#                               PATCH     /galleries/:id(.:format)                      galleries#update
#                               PUT       /galleries/:id(.:format)                      galleries#update
#                               DELETE    /galleries/:id(.:format)                      galleries#destroy
#                      products GET       /products(.:format)                           products#index
#                               POST      /products(.:format)                           products#create
#                   new_product GET       /products/new(.:format)                       products#new
#                  edit_product GET       /products/:id/edit(.:format)                  products#edit
#                       product GET       /products/:id(.:format)                       products#show
#                               PATCH     /products/:id(.:format)                       products#update
#                               PUT       /products/:id(.:format)                       products#update
#                               DELETE    /products/:id(.:format)                       products#destroy
#                 product_codes GET       /product_codes(.:format)                      product_codes#index
#                               POST      /product_codes(.:format)                      product_codes#create
#              new_product_code GET       /product_codes/new(.:format)                  product_codes#new
#             edit_product_code GET       /product_codes/:id/edit(.:format)             product_codes#edit
#                  product_code GET       /product_codes/:id(.:format)                  product_codes#show
#                               PATCH     /product_codes/:id(.:format)                  product_codes#update
#                               PUT       /product_codes/:id(.:format)                  product_codes#update
#                               DELETE    /product_codes/:id(.:format)                  product_codes#destroy
#                        orders GET       /orders(.:format)                             orders#index
#                               POST      /orders(.:format)                             orders#create
#                     new_order GET       /orders/new(.:format)                         orders#new
#                    edit_order GET       /orders/:id/edit(.:format)                    orders#edit
#                         order GET       /orders/:id(.:format)                         orders#show
#                               PATCH     /orders/:id(.:format)                         orders#update
#                               PUT       /orders/:id(.:format)                         orders#update
#                               DELETE    /orders/:id(.:format)                         orders#destroy
#                   order_items GET       /order_items(.:format)                        order_items#index
#                               POST      /order_items(.:format)                        order_items#create
#                new_order_item GET       /order_items/new(.:format)                    order_items#new
#               edit_order_item GET       /order_items/:id/edit(.:format)               order_items#edit
#                    order_item GET       /order_items/:id(.:format)                    order_items#show
#                               PATCH     /order_items/:id(.:format)                    order_items#update
#                               PUT       /order_items/:id(.:format)                    order_items#update
#                               DELETE    /order_items/:id(.:format)                    order_items#destroy
#                 payment_types GET       /payment_types(.:format)                      payment_types#index
#                               POST      /payment_types(.:format)                      payment_types#create
#              new_payment_type GET       /payment_types/new(.:format)                  payment_types#new
#             edit_payment_type GET       /payment_types/:id/edit(.:format)             payment_types#edit
#                  payment_type GET       /payment_types/:id(.:format)                  payment_types#show
#                               PATCH     /payment_types/:id(.:format)                  payment_types#update
#                               PUT       /payment_types/:id(.:format)                  payment_types#update
#                               DELETE    /payment_types/:id(.:format)                  payment_types#destroy
#                order_statuses GET       /order_statuses(.:format)                     order_statuses#index
#                               POST      /order_statuses(.:format)                     order_statuses#create
#              new_order_status GET       /order_statuses/new(.:format)                 order_statuses#new
#             edit_order_status GET       /order_statuses/:id/edit(.:format)            order_statuses#edit
#                  order_status GET       /order_statuses/:id(.:format)                 order_statuses#show
#                               PATCH     /order_statuses/:id(.:format)                 order_statuses#update
#                               PUT       /order_statuses/:id(.:format)                 order_statuses#update
#                               DELETE    /order_statuses/:id(.:format)                 order_statuses#destroy
#              new_user_session GET       /users/sign_in(.:format)                      sessions#new
#                  user_session POST      /users/sign_in(.:format)                      sessions#create
#          destroy_user_session GET       /users/sign_out(.:format)                     sessions#destroy
#       user_omniauth_authorize GET|POST  /users/auth/:provider(.:format)               omniauth_callbacks#passthru {:provider=>/facebook|vkontakte/}
#        user_omniauth_callback GET|POST  /users/auth/:action/callback(.:format)        omniauth_callbacks#:action
#                 user_password POST      /users/password(.:format)                     devise/passwords#create
#             new_user_password GET       /users/password/new(.:format)                 devise/passwords#new
#            edit_user_password GET       /users/password/edit(.:format)                devise/passwords#edit
#                               PATCH     /users/password(.:format)                     devise/passwords#update
#                               PUT       /users/password(.:format)                     devise/passwords#update
#      cancel_user_registration GET       /users/cancel(.:format)                       registrations#cancel
#             user_registration POST      /users(.:format)                              registrations#create
#         new_user_registration GET       /users/sign_up(.:format)                      registrations#new
#        edit_user_registration GET       /users/edit(.:format)                         registrations#edit
#                               PATCH     /users(.:format)                              registrations#update
#                               PUT       /users(.:format)                              registrations#update
#                               DELETE    /users(.:format)                              registrations#destroy
#                          home GET       /home(.:format)                               static_pages#home
#                      contacts GET       /contacts(.:format)                           static_pages#contacts
#                         about GET       /about(.:format)                              static_pages#about
#                     userslist GET       /userslist(.:format)                          static_pages#userslist
#                  privatpolicy GET       /privatpolicy(.:format)                       static_pages#privatpolicy
#                       catalog GET       /catalog(.:format)                            categories#catalog
#                    adminpanel GET       /adminpanel(.:format)                         static_pages#adminpanel
#                remote_sign_up GET       /remote_sign_up(.:format)                     remote_content#remote_sign_up
#                remote_sign_in GET       /remote_sign_in(.:format)                     remote_content#remote_sign_in
#              remote_image_add POST      /remote_image_add(.:format)                   image#create_from_gallery
#                 finish_signup GET|PATCH /users/:id/finish_signup(.:format)            users#finish_signup
#                      sign_out GET       /sign_out(.:format)                           devise/sessions#destroy
#                               DELETE    /sign_out(.:format)                           devise/sessions#destroy
#                         users GET       /users(.:format)                              users#index
#                               POST      /users(.:format)                              users#create
#                      new_user GET       /users/new(.:format)                          users#new
#                     edit_user GET       /users/:id/edit(.:format)                     users#edit
#                          user GET       /users/:id(.:format)                          users#show
#                               PATCH     /users/:id(.:format)                          users#update
#                               PUT       /users/:id(.:format)                          users#update
#                               DELETE    /users/:id(.:format)                          users#destroy
#       session_update_category GET       /categories/:id/session_update(.:format)      categories#session_update
#                               GET       /categories(.:format)                         categories#index
#                               POST      /categories(.:format)                         categories#create
#                               GET       /categories/new(.:format)                     categories#new
#                               GET       /categories/:id/edit(.:format)                categories#edit
#                               GET       /categories/:id(.:format)                     categories#show
#                               PATCH     /categories/:id(.:format)                     categories#update
#                               PUT       /categories/:id(.:format)                     categories#update
#                               DELETE    /categories/:id(.:format)                     categories#destroy
#                     gid_color GET       /colors/:id/gid(.:format)                     colors#gid
#                               GET       /colors(.:format)                             colors#index
#                               POST      /colors(.:format)                             colors#create
#                               GET       /colors/new(.:format)                         colors#new
#                               GET       /colors/:id/edit(.:format)                    colors#edit
#                               GET       /colors/:id(.:format)                         colors#show
#                               PATCH     /colors/:id(.:format)                         colors#update
#                               PUT       /colors/:id(.:format)                         colors#update
#                               DELETE    /colors/:id(.:format)                         colors#destroy
#                  image_fabric GET       /fabrics/:id/image(.:format)                  fabrics#image
#                               GET       /fabrics(.:format)                            fabrics#index
#                               POST      /fabrics(.:format)                            fabrics#create
#                               GET       /fabrics/new(.:format)                        fabrics#new
#                               GET       /fabrics/:id/edit(.:format)                   fabrics#edit
#                               GET       /fabrics/:id(.:format)                        fabrics#show
#                               PATCH     /fabrics/:id(.:format)                        fabrics#update
#                               PUT       /fabrics/:id(.:format)                        fabrics#update
#                               DELETE    /fabrics/:id(.:format)                        fabrics#destroy
#               gallery_gallery GET       /galleries/:id/gallery(.:format)              galleries#gallery
#               product_gallery POST      /galleries/:id/product(.:format)              galleries#product
#                               GET       /galleries(.:format)                          galleries#index
#                               POST      /galleries(.:format)                          galleries#create
#                               GET       /galleries/new(.:format)                      galleries#new
#                               GET       /galleries/:id/edit(.:format)                 galleries#edit
#                               GET       /galleries/:id(.:format)                      galleries#show
#                               PATCH     /galleries/:id(.:format)                      galleries#update
#                               PUT       /galleries/:id(.:format)                      galleries#update
#                               DELETE    /galleries/:id(.:format)                      galleries#destroy
#               picture_product POST      /products/:id/picture(.:format)               products#picture
#           get_catalog_product GET       /products/:id/get_catalog(.:format)           products#get_catalog
#          show_product_product GET       /products/:id/show_product(.:format)          products#show_product
#             show_mode_product GET       /products/:id/show_mode(.:format)             products#show_mode
#                               GET       /products(.:format)                           products#index
#                               POST      /products(.:format)                           products#create
#                               GET       /products/new(.:format)                       products#new
#                               GET       /products/:id/edit(.:format)                  products#edit
#                               GET       /products/:id(.:format)                       products#show
#                               PATCH     /products/:id(.:format)                       products#update
#                               PUT       /products/:id(.:format)                       products#update
#                               DELETE    /products/:id(.:format)                       products#destroy
# get_free_gallery_product_code GET       /product_codes/:id/get_free_gallery(.:format) product_codes#get_free_gallery
#      set_gallery_product_code GET       /product_codes/:id/set_gallery(.:format)      product_codes#set_gallery
#                               GET       /product_codes(.:format)                      product_codes#index
#                               POST      /product_codes(.:format)                      product_codes#create
#                               GET       /product_codes/new(.:format)                  product_codes#new
#                               GET       /product_codes/:id/edit(.:format)             product_codes#edit
#                               GET       /product_codes/:id(.:format)                  product_codes#show
#                               PATCH     /product_codes/:id(.:format)                  product_codes#update
#                               PUT       /product_codes/:id(.:format)                  product_codes#update
#                               DELETE    /product_codes/:id(.:format)                  product_codes#destroy
#         create_box_order_item GET       /order_items/:id/create_box(.:format)         order_items#create_box
#          add_order_order_item PATCH     /order_items/:id/add_order(.:format)          order_items#add_order
#      add_order_box_order_item PATCH     /order_items/:id/add_order_box(.:format)      order_items#add_order_box
#                               GET       /order_items(.:format)                        order_items#index
#                               POST      /order_items(.:format)                        order_items#create
#                               GET       /order_items/new(.:format)                    order_items#new
#                               GET       /order_items/:id/edit(.:format)               order_items#edit
#                               GET       /order_items/:id(.:format)                    order_items#show
#                               PATCH     /order_items/:id(.:format)                    order_items#update
#                               PUT       /order_items/:id(.:format)                    order_items#update
#                               DELETE    /order_items/:id(.:format)                    order_items#destroy
#                  newbox_order GET       /orders/:id/newbox(.:format)                  orders#newbox
#                    last_order GET       /orders/:id/last(.:format)                    orders#last
#                 history_order GET       /orders/:id/history(.:format)                 orders#history
#                add_attr_order PATCH     /orders/:id/add_attr(.:format)                orders#add_attr
#                 approve_order GET       /orders/:id/approve(.:format)                 orders#approve
#                               GET       /orders(.:format)                             orders#index
#                               POST      /orders(.:format)                             orders#create
#                               GET       /orders/new(.:format)                         orders#new
#                               GET       /orders/:id/edit(.:format)                    orders#edit
#                               GET       /orders/:id(.:format)                         orders#show
#                               PATCH     /orders/:id(.:format)                         orders#update
#                               PUT       /orders/:id(.:format)                         orders#update
#                               DELETE    /orders/:id(.:format)                         orders#destroy
#                          root GET       /                                             static_pages#home
#                    refile_app           /attachments                                  #<Refile::App app_file="/home/ec2-user/.rvm/gems/ruby-2.1.5/gems/refile-0.6.2/lib/refile/app.rb">
#                entypo_charmap GET       /entypo/charmap(.:format)                     entypo/charmap#index
#





Rails.application.routes.draw do
  resources :categories
  resources :brands
  resources :fabrics
  resources :sizes
  resources :colors
  resources :images
  resources :galleries
  resources :products
  resources :product_codes
  resources :orders
  resources :order_items
  resources :payment_types
  resources :order_statuses


  devise_for :users, :controllers => { registrations: 'registrations',
                                       omniauth_callbacks: 'omniauth_callbacks', sessions: 'sessions' }
  get 'home' => 'static_pages#home', :as => 'home'
  get 'contacts' => 'static_pages#contacts', :as => 'contacts'
  get 'about' => 'static_pages#about', :as => 'about'
  get 'order' => 'static_pages#order', :as => '_order'
  get 'userslist' => 'static_pages#userslist', :as => 'userslist'
  get 'privatpolicy' => 'static_pages#privatpolicy', :as => 'privatpolicy'
  get 'catalog' => 'categories#catalog', :as => 'catalog'
  get 'adminpanel' => 'static_pages#adminpanel', :as => 'adminpanel'

  match 'remote_sign_up', to: 'remote_content#remote_sign_up', via: [:get]
  match 'remote_sign_in', to: 'remote_content#remote_sign_in', via: [:get]
  match 'remote_image_add', to: 'image#create_from_gallery', via: [:post]
  match '/users/:id/finish_signup' => 'users#finish_signup',
        via: [:get, :patch], as: :finish_signup
  devise_scope :users do
    get "sign_out", to: 'devise/sessions#destroy'
    delete "sign_out", to: 'devise/sessions#destroy'
  end

  resources :users

  resources :categories do
    member do
      get :session_update
    end
  end

  resources :colors do
    member do
      get :gid
    end
  end

  resources :fabrics do
    member do
      get :image
    end
  end

  resources :galleries do
    member do
      get  :gallery
      post :product
    end
  end

  resources :products do
    member do
      post :picture
      get :get_catalog
      get :show_product
      get :show_mode
      get :get_deffered
      get :remove_deffered
    end
  end

  resources :product_codes do
    member do
      get :get_free_gallery
      get :set_gallery
    end
  end

  resources :order_items do
    member do
      get :create_box
      patch :add_order
      patch :add_order_box
    end
  end

  resources :orders do
    member do
      get :newbox
      get :last
      get :history
      patch :add_attr
      get :approve
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

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
