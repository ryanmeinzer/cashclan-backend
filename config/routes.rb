Rails.application.routes.draw do
  resources :members
  resources :transactions
  direct :members do
    "https://cashclan.com"
  end
  direct :transactions do
    "https://cashclan.com"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
