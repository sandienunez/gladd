Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}

  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  get '/signup', to: 'users#new', as: 'register'
  post '/signup' => 'users#create'
  # delete '/tasks/:id', to: 'tasks#destroy' as: 'delete_task'
  resources :users
  resources :comments
  resources :tasks
  resources :daily_checkins
  root to: 'user#new'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
