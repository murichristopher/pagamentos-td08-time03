# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins

  authenticated :admin do
    root to: 'home#index', as: :authenticated_root
    resources :exchange_rates, only: %i[index new create]
    resources :admin_approvals, only: [:index] do
      post '/:admin_id', to: 'admin_approvals#create', as: 'create', on: :collection
    end
    resources :exchange_rate_approvals, only: %i[index] do
      post '/:exchange_rate_id', to: 'exchange_rate_approvals#create', as: 'create', on: :collection
    end
    resources :daily_credit_limits, only: %i[index new create]
  end

  root to: redirect('/admins/sign_in')

  namespace :api do
    namespace :v1 do
      resources :clients, only: [:show] do
        post 'credit', on: :collection, to: 'clients#add_credit'
      end
      resources :exchange_rates, only: [:index] do
        get 'current', on: :collection
      end
    end
  end
end
