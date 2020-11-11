Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts
  root 'home#top'
  get 'home/about' => 'home#about'
  resources :tags, only: [:new, :create, :index, :show]
  resources :relationships, only: [:create, :destroy]
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
  	resources :post_comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end