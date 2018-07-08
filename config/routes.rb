Rails.application.routes.draw do
  resources :trucks
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :events
  resources :jobs

  post "claims/begin:id" => "claims#begin", :as => 'begin_claim'
  post "claims/contact_to:id" => "claims#contact_to", :as => 'contact_to_claim'
  post "claims/review:id" => "claims#review", :as => 'review_claim'
  post "claims/finished:id" => "claims#finished", :as => 'finished_claim'
  resources :claims

  get "teams/home_dir" => "teams#home_dir", :as => 'dir_team'
  get "teams/home_technician" => "teams#home_technician", :as => 'technician_team'
  get "teams/daily_report" => "teams#daily_report", :as => 'daily_report'
  resources :teams

  get "dreports/end_shift:id" => "dreports#end_shift", :as => 'shift'
  resources :dreport

  root 'teams#home'

end
