Rails.application.routes.draw do
  devise_for :users do
    get 'logout' => 'devise/sessions#destroy'
  end
  
  root to: 'restaurants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index show] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[show index update edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
