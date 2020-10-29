Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts
  root 'home#top'
  get 'home/about' => 'home#about'
  resources :tags, only: [:new, :create, :index, :show]
  resource :relationships, only: [:create, :destroy]
  resources :posts, only: [:new, :create, :index, :show] do
  	resources :post_comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end

# bookers2のルーティングを	真似して書いただけ・後で修正
