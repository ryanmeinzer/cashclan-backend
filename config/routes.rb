Rails.application.routes.draw do
  get '/members', to: "https://cashclan.com"
  get '/transactions', to: "https://cashclan.com"
  resources :members
  resources :transactions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
