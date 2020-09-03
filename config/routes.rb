Rails.application.routes.draw do
  # devise_for :users
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  get '/signup', to: 'users#new', as: 'register'
  post '/signup' => 'users#create'
  # delete '/tasks/:id', to: 'tasks#destroy' as: 'delete_task'
  resources :users
  resources :comments
  resources :tasks
  resources :daily_checkins
  devise_for :users, :controllers => {registrations: 'registrations' }

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
