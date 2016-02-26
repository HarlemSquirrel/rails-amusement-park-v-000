Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root to: 'sessions#index'
  #get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  post '/signin', to: 'sessions#create'

end
