Rails.application.routes.draw do
  direct :members do
    "https://cashclan.com"
  end
  direct :transactions do
    "https://cashclan.com"
  end
  resources :members
  resources :transactions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
