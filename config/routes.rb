Rails.application.routes.draw do
  root to: 'sessions#index'

  resources :users, only: [:new, :create, :show]

  resources :attractions #, only: [:index, :show, :new, :update, :create]
  post '/attractions/:id/take_ride', to: 'attractions#take_ride'
  #get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  post '/signin', to: 'sessions#create'

end
