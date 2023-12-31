Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"

  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :buyers, only: [:new, :create]
  end
  

  
end
