Rails.application.routes.draw do
  # devise_for :users
  get '/' => 'sessions#index'
  get '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :comments
  recources :tasks
  resources :daily_checkins
  devise_for :users, :controllers => {registrations: 'registrations' }

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
