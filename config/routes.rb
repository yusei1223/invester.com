Rails.application.routes.draw do
  get 'users/show'
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'top' => 'homes#top'
  resources :users do
    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :articles do
    get :bookmarks, on: :collection
    get :ranks, on: :collection
    resource :bookmarks, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
  resources :inquires
  resources :notifications, only: [:index] do
    get :check, on: :collection
  end
end
