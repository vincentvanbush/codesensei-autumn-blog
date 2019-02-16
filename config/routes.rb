require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'welcome#index'

  mount Sidekiq::Web => '/sidekiq'

  resources :articles do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :pictures do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end

  get '/weather' => 'weather#show'
end
