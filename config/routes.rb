Rails.application.routes.draw do

  resources :admin_securities
  root 'events#index'

  resources :attendances
  resources :events
  resources :admins, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :admin
  
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/loginout', to: 'sessions#destroy'
  post '/loginout', to: 'sessions#destroy' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
