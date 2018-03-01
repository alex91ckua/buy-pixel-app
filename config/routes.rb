Rails.application.routes.draw do

  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show, :create]
  root 'home#index'
  resource :charge, only: [:new, :create]
  get 'charge/success', to: 'charges#success'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
