Rails.application.routes.draw do
  resources :trucks
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :claims
  resources :events
  resources :teams
  resources :jobs

  root 'events#index'

end
