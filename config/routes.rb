Rails.application.routes.draw do
  resources :receipts
  resources :serves
  resources :bookings
  resources :staffs
  resources :members
  resources :announcements
  devise_for :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
