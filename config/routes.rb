Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index show] do
    resources :bookings, only: %i[new create update edit]
  end
  resources :bookings, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about'

  get 'my_bookings', to: 'pages#my_bookings'
end
