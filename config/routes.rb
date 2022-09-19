Rails.application.routes.draw do

  resources :admin_securities
  resources :admins
  root 'events#index'

  resources :attendances
  resources :events
  resources :admins, only: [:new, :create, :edit, :update, :show, :destroy]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
