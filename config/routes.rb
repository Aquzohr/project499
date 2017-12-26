Rails.application.routes.draw do


  get 'package', to: 'package#index'

  scope '/package' do
    resources :nontrainer_packages
    resources :trainer_packages
  end

  resources :receipts
  
  resources :serves
  post 'serves/checkout_all'

  resources :bookings
  resources :staffs
  resources :members
  resources :announcements
  resources :branches
  resources :package_occupiedbies

  devise_for :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
