Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show, :create]
  root 'home#index'
  resource :charge, only: [:new, :create]
  resource :privacy_policy, :path => 'privacy-policy', only: [:show]
  resource :terms_and_conditions, :path => 'terms', only: [:show]
  get 'charge/success', to: 'charges#success'
  post 'contact_us/create'
  get 'contact_us/status'
  resources :locales, only: :update
end
