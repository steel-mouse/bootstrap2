Rails.application.routes.draw do
  get 'favorites/create'

  get 'sessions/new'

  resources :blogs do
    collection do
      post :confirm
      get :top
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  resources :favorites, only: [:create, :destroy]

end
