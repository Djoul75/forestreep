Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: %i[index show]
  resources :forests do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create update destroy]
    collection do
      get :index_owner
    end
  end
end
