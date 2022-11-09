Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  root to: 'homes#top'
  get 'posts/index'
  devise_for :users

  get "home/about" => "homes#about", as: "about"
 resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show, :edit, :update]


resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end




end