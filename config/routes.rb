Rails.application.routes.draw do

  root 'links#index'

  resources :attendances
  resources :events
  resources :links
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
