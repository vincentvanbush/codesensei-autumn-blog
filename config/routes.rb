Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :articles do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
