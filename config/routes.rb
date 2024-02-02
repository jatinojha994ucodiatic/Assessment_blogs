Rails.application.routes.draw do
  
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  root "home#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :articles
  
  devise_for :users, controllers: {  
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }
  
  ActiveAdmin.routes(self)

end
