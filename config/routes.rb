Rails.application.routes.draw do


  get 'report', to: 'report#index'
  post 'report', to: 'report#index'

  resources :packages
  resources :nontrainer_packages
  resources :trainer_packages

  resources :receipts
  
  resources :serves
  post 'serves/checkout_all'

  resources :bookings
  post 'bookings/confirm'

  resources :staffs
  resources :members
  resources :announcements
  resources :branches
  resources :package_occupiedbies

  devise_for :users#, controllers: { registrations: 'registrations' }
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
