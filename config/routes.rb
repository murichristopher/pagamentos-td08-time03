# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins

  authenticated :admin do
    root to: 'home#index', as: :authenticated_root
    resources :exchange_rates, only: %i[index new create]
    resources :approvals, only: [:index]
    post '/approvals/:id', to: 'approvals#create', as: 'create_approval'
    resources :exchange_rate_approvals, only: %i[index] do
      post '/:exchange_rate_id', to: 'exchange_rate_approvals#create', as: 'create', on: :collection
    end
    resources :daily_credit_limits, only: %i[index new create]
  end

  root to: redirect('/admins/sign_in')

  namespace :api do
    namespace :v1 do
      scope :clients do
        post 'credit', to: 'clients#add_credit'
      end
      scope :exchange_rates do
        get 'current', to: 'exchange_rates#current'
      end
    end
  end
end
