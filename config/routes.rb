Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homepage#index'



  resources :books do
    resource :reservations, only: [:new, :create, :destroy]
  end 
  devise_for :users, :controllers => { :omniauth_callbacks =>"users/omniauth_callbacks", :registrations => "users/registrations"}
  resources :users, only: [:show]
end
