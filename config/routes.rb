Rails.application.routes.draw do
  # devise_for :users
  root 'application#index'
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registration#new'
   end
   

  resources :comments
  resources :tasks
  resources :daily_routines

  #nested resources = treat instances of models as URLs, and is key to using resourceful style

  #daily_checkin_task_path
  #or 
resources :tasks do
  resources :comments, only: [:index, :new, :create, :show] #build 3 nested routes
end


#<%= link_to 'Ad details', [@magazine, @ad] %>



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
