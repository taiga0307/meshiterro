Rails.application.routes.draw do
  devise_for :users
  root 'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create]
    # resource単数形の理由：コントローラのidがリクエストに含まれなくなる。
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  resources :users, only: [:show, :edit, :update]
end