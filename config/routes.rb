Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:index, :show, :new, :create]
  end
  resources :bookings, only: [:index, :show]
  get 'confirm', to: 'bookings#confirm'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
