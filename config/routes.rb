Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: %i[index show create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  resources :microposts, only: %i[create destroy]
  resources :favorites, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end

# s.do
