Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'articles#index'
   get 'top' => 'homes#top'
   resources :users do
    get :bookmarks, on: :collection
    resource :relationships, only: [:create, :destroy]
  	 get 'followings' => 'relationships#followings', as: 'followings'
  	 get 'followers' => 'relationships#followers', as: 'followers'
  	end

   resources :articles do
    resource :bookmarks, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
   end
   resources :inquires
   resources :notifications, only: :index
end
