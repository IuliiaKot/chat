Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :users, only: [:new, :create]
  resources :conversations, only: [:create] do
    resources :messages, only: [:create]
  end
end
