Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homepage#index'



  resources :books
  devise_for :users, :controllers => { :omniauth_callbacks =>"users/omniauth_callbacks", :registrations => "users/registrations"}
end
