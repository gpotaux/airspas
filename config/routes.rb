Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  resources :spas do
    resources :bookings, only: ['new', 'create']
  end

  resources :bookings, only: ['index', 'edit']
end
