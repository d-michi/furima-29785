Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # get 'items/edit', to: 'items#edit'

  resources :users
  resources :items, only: [:index, :show, :new, :create, :edit, :update]
end