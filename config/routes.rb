Rails.application.routes.draw do
  resources :buyers
  resources :sellers
  resources :members
  resources :transactions
  resources :getters
  resources :givers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
