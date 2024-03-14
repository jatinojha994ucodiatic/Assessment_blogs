require 'resque/server'

Rails.application.routes.draw do
  get 'users/index'
  authenticate :user, -> (u){u.has_role?(:admin)} do
    mount Resque::Server.new, :at => "/resque/jobs"
  end
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  root "home#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :articles do
    resources :comments
  end
  get 'articles/delete/:id', controller: "articles", action: "destroy", as: :article_delete
  
  devise_for :users, controllers: {  
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }
  devise_scope :user do
    get "registrations/list", to: "users/registrations#list"
  end
  # get 'users/registrations/list', to: 'users/registrations#list'

  resources :users, only: [:index] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end
end
