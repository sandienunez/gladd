Rails.application.routes.draw do
  # devise_for :users
  root 'application#index'
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registration#new'
   end
   

    

  #  delete '/tasks/:id', to: 'tasks#destroy' as: 'delete_task'
  resources :comments
  resources :tasks
  resources :daily_checkins
  # root to: 'user#new'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
