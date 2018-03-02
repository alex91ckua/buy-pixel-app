Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show, :create]
  root 'home#index'
  resource :charge, only: [:new, :create]
  get 'charge/success', to: 'charges#success'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
