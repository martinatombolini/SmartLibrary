Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homepage#index'

  get '/login' => 'libraries#show'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :books
end
