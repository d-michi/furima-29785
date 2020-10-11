Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get 'items/new/:id', to: 'items#fee_calculation'
  post 'items', to: 'items#create'
  # get 'items/edit', to: 'items#edit'

  
  resources :users
  resources :items do
    resources :orders, only:[:index, :create]
  end

end