require "sidekiq/web"

Rails.application.routes.draw do
  authenticate :admin, ->(admin) { admin.present? } do
    mount Sidekiq::Web => "/sidekiq"
  end
  devise_for :admins
  use_doorkeeper
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#show"

  namespace :admins do
    namespace :aml do
      resources :name_screenings
    end
    resource :dashboard, only: [ :show ]
    resources :account_transactions
    resources :loans do
      member do
        post :cancel
        post :approve
      end
    end
  end
end
