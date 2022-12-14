# frozen_string_literal: true

Rails.application.routes.draw do
  resources :admin_securities
  root 'events#index'

  resources :rsvps
  resources :attendances, only: %i[index new create edit update show destroy]
  resources :events, only: %i[index new create edit update show destroy]

  resources :links
  resources :sections

  resources :admins, only: %i[new create edit update show destroy]
  resources :admin
  resources :registrations

  resources :users, only: %i[index new create edit update show destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/loginout', to: 'sessions#destroy'
  post '/loginout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
