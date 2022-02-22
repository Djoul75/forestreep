Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create edit update delete] do
    resources :forests, only: %i[new create edit update]
  end
  resources :forests, only: %i[index show delete] do
    resources :reviews, only: %i[new create]
  end
end
