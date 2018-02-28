Rails.application.routes.draw do
  resource :cart, only: [:show, :create]
  root 'home#index'
  resource :charge, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
