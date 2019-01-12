Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :articles do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
