# == Route Map
#
#                   Prefix Verb      URI Pattern                            Controller#Action
#               categories GET       /categories(.:format)                  categories#index
#                          POST      /categories(.:format)                  categories#create
#             new_category GET       /categories/new(.:format)              categories#new
#            edit_category GET       /categories/:id/edit(.:format)         categories#edit
#                 category GET       /categories/:id(.:format)              categories#show
#                          PATCH     /categories/:id(.:format)              categories#update
#                          PUT       /categories/:id(.:format)              categories#update
#                          DELETE    /categories/:id(.:format)              categories#destroy
#                   brands GET       /brands(.:format)                      brands#index
#                          POST      /brands(.:format)                      brands#create
#                new_brand GET       /brands/new(.:format)                  brands#new
#               edit_brand GET       /brands/:id/edit(.:format)             brands#edit
#                    brand GET       /brands/:id(.:format)                  brands#show
#                          PATCH     /brands/:id(.:format)                  brands#update
#                          PUT       /brands/:id(.:format)                  brands#update
#                          DELETE    /brands/:id(.:format)                  brands#destroy
#                  fabrics GET       /fabrics(.:format)                     fabrics#index
#                          POST      /fabrics(.:format)                     fabrics#create
#               new_fabric GET       /fabrics/new(.:format)                 fabrics#new
#              edit_fabric GET       /fabrics/:id/edit(.:format)            fabrics#edit
#                   fabric GET       /fabrics/:id(.:format)                 fabrics#show
#                          PATCH     /fabrics/:id(.:format)                 fabrics#update
#                          PUT       /fabrics/:id(.:format)                 fabrics#update
#                          DELETE    /fabrics/:id(.:format)                 fabrics#destroy
#                    sizes GET       /sizes(.:format)                       sizes#index
#                          POST      /sizes(.:format)                       sizes#create
#                 new_size GET       /sizes/new(.:format)                   sizes#new
#                edit_size GET       /sizes/:id/edit(.:format)              sizes#edit
#                     size GET       /sizes/:id(.:format)                   sizes#show
#                          PATCH     /sizes/:id(.:format)                   sizes#update
#                          PUT       /sizes/:id(.:format)                   sizes#update
#                          DELETE    /sizes/:id(.:format)                   sizes#destroy
#                   colors GET       /colors(.:format)                      colors#index
#                          POST      /colors(.:format)                      colors#create
#                new_color GET       /colors/new(.:format)                  colors#new
#               edit_color GET       /colors/:id/edit(.:format)             colors#edit
#                    color GET       /colors/:id(.:format)                  colors#show
#                          PATCH     /colors/:id(.:format)                  colors#update
#                          PUT       /colors/:id(.:format)                  colors#update
#                          DELETE    /colors/:id(.:format)                  colors#destroy
#                   images GET       /images(.:format)                      images#index
#                          POST      /images(.:format)                      images#create
#                new_image GET       /images/new(.:format)                  images#new
#               edit_image GET       /images/:id/edit(.:format)             images#edit
#                    image GET       /images/:id(.:format)                  images#show
#                          PATCH     /images/:id(.:format)                  images#update
#                          PUT       /images/:id(.:format)                  images#update
#                          DELETE    /images/:id(.:format)                  images#destroy
#                galleries GET       /galleries(.:format)                   galleries#index
#                          POST      /galleries(.:format)                   galleries#create
#              new_gallery GET       /galleries/new(.:format)               galleries#new
#             edit_gallery GET       /galleries/:id/edit(.:format)          galleries#edit
#                  gallery GET       /galleries/:id(.:format)               galleries#show
#                          PATCH     /galleries/:id(.:format)               galleries#update
#                          PUT       /galleries/:id(.:format)               galleries#update
#                          DELETE    /galleries/:id(.:format)               galleries#destroy
#                 products GET       /products(.:format)                    products#index
#                          POST      /products(.:format)                    products#create
#              new_product GET       /products/new(.:format)                products#new
#             edit_product GET       /products/:id/edit(.:format)           products#edit
#                  product GET       /products/:id(.:format)                products#show
#                          PATCH     /products/:id(.:format)                products#update
#                          PUT       /products/:id(.:format)                products#update
#                          DELETE    /products/:id(.:format)                products#destroy
#         new_user_session GET       /users/sign_in(.:format)               sessions#new
#             user_session POST      /users/sign_in(.:format)               sessions#create
#     destroy_user_session GET       /users/sign_out(.:format)              sessions#destroy
#  user_omniauth_authorize GET|POST  /users/auth/:provider(.:format)        omniauth_callbacks#passthru {:provider=>/facebook|vkontakte/}
#   user_omniauth_callback GET|POST  /users/auth/:action/callback(.:format) omniauth_callbacks#:action
#            user_password POST      /users/password(.:format)              devise/passwords#create
#        new_user_password GET       /users/password/new(.:format)          devise/passwords#new
#       edit_user_password GET       /users/password/edit(.:format)         devise/passwords#edit
#                          PATCH     /users/password(.:format)              devise/passwords#update
#                          PUT       /users/password(.:format)              devise/passwords#update
# cancel_user_registration GET       /users/cancel(.:format)                registrations#cancel
#        user_registration POST      /users(.:format)                       registrations#create
#    new_user_registration GET       /users/sign_up(.:format)               registrations#new
#   edit_user_registration GET       /users/edit(.:format)                  registrations#edit
#                          PATCH     /users(.:format)                       registrations#update
#                          PUT       /users(.:format)                       registrations#update
#                          DELETE    /users(.:format)                       registrations#destroy
#                     home GET       /home(.:format)                        static_pages#home
#                 contacts GET       /contacts(.:format)                    static_pages#contacts
#                    about GET       /about(.:format)                       static_pages#about
#                userslist GET       /userslist(.:format)                   static_pages#userslist
#             privatpolicy GET       /privatpolicy(.:format)                static_pages#privatpolicy
#               adminpanel GET       /adminpanel(.:format)                  static_pages#adminpanel
#           remote_sign_up GET       /remote_sign_up(.:format)              remote_content#remote_sign_up
#           remote_sign_in GET       /remote_sign_in(.:format)              remote_content#remote_sign_in
#         remote_image_add POST      /remote_image_add(.:format)            image#create_from_gallery
#            finish_signup GET|PATCH /users/:id/finish_signup(.:format)     users#finish_signup
#                 sign_out GET       /sign_out(.:format)                    devise/sessions#destroy
#                          DELETE    /sign_out(.:format)                    devise/sessions#destroy
#                    users GET       /users(.:format)                       users#index
#                          POST      /users(.:format)                       users#create
#                 new_user GET       /users/new(.:format)                   users#new
#                edit_user GET       /users/:id/edit(.:format)              users#edit
#                     user GET       /users/:id(.:format)                   users#show
#                          PATCH     /users/:id(.:format)                   users#update
#                          PUT       /users/:id(.:format)                   users#update
#                          DELETE    /users/:id(.:format)                   users#destroy
#                gid_color GET       /colors/:id/gid(.:format)              colors#gid
#                          GET       /colors(.:format)                      colors#index
#                          POST      /colors(.:format)                      colors#create
#                          GET       /colors/new(.:format)                  colors#new
#                          GET       /colors/:id/edit(.:format)             colors#edit
#                          GET       /colors/:id(.:format)                  colors#show
#                          PATCH     /colors/:id(.:format)                  colors#update
#                          PUT       /colors/:id(.:format)                  colors#update
#                          DELETE    /colors/:id(.:format)                  colors#destroy
#             image_fabric GET       /fabrics/:id/image(.:format)           fabrics#image
#                          GET       /fabrics(.:format)                     fabrics#index
#                          POST      /fabrics(.:format)                     fabrics#create
#                          GET       /fabrics/new(.:format)                 fabrics#new
#                          GET       /fabrics/:id/edit(.:format)            fabrics#edit
#                          GET       /fabrics/:id(.:format)                 fabrics#show
#                          PATCH     /fabrics/:id(.:format)                 fabrics#update
#                          PUT       /fabrics/:id(.:format)                 fabrics#update
#                          DELETE    /fabrics/:id(.:format)                 fabrics#destroy
#          gallery_gallery GET       /galleries/:id/gallery(.:format)       galleries#gallery
#          product_gallery POST      /galleries/:id/product(.:format)       galleries#product
#                          GET       /galleries(.:format)                   galleries#index
#                          POST      /galleries(.:format)                   galleries#create
#                          GET       /galleries/new(.:format)               galleries#new
#                          GET       /galleries/:id/edit(.:format)          galleries#edit
#                          GET       /galleries/:id(.:format)               galleries#show
#                          PATCH     /galleries/:id(.:format)               galleries#update
#                          PUT       /galleries/:id(.:format)               galleries#update
#                          DELETE    /galleries/:id(.:format)               galleries#destroy
#          picture_product POST      /products/:id/picture(.:format)        products#picture
#                          GET       /products(.:format)                    products#index
#                          POST      /products(.:format)                    products#create
#                          GET       /products/new(.:format)                products#new
#                          GET       /products/:id/edit(.:format)           products#edit
#                          GET       /products/:id(.:format)                products#show
#                          PATCH     /products/:id(.:format)                products#update
#                          PUT       /products/:id(.:format)                products#update
#                          DELETE    /products/:id(.:format)                products#destroy
#                     root GET       /                                      static_pages#home
#               refile_app           /attachments                           #<Refile::App app_file="/home/ec2-user/.rvm/gems/ruby-2.1.5/gems/refile-0.6.2/lib/refile/app.rb">
#           entypo_charmap GET       /entypo/charmap(.:format)              entypo/charmap#index
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

  devise_for :users, :controllers => { registrations: 'registrations',
                                       omniauth_callbacks: 'omniauth_callbacks', sessions: 'sessions' }
  get 'home' => 'static_pages#home', :as => 'home'
  get 'contacts' => 'static_pages#contacts', :as => 'contacts'
  get 'about' => 'static_pages#about', :as => 'about'
  get 'userslist' => 'static_pages#userslist', :as => 'userslist'
  get 'privatpolicy' => 'static_pages#privatpolicy', :as => 'privatpolicy'
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
