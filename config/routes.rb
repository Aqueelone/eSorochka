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
#                     root GET       /                                      static_pages#home
#           entypo_charmap GET       /entypo/charmap(.:format)              entypo/charmap#index
#



Rails.application.routes.draw do
  resources :categories

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
  match '/users/:id/finish_signup' => 'users#finish_signup',
        via: [:get, :patch], as: :finish_signup
  devise_scope :users do
    get "sign_out", to: 'devise/sessions#destroy'
    delete "sign_out", to: 'devise/sessions#destroy'
  end

  resources :users

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
