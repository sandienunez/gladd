Rails.application.routes.draw do
 
  root to: 'application#index'
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registration#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
   end
   

  resources :comments
  resources :tasks
  resources :journals
  resources :daily_routines

  #nested resources = treat instances of models as URLs, and is key to using resourceful style

resources :tasks do
  resources :comments, only: [:index, :new, :create, :show] 
end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
