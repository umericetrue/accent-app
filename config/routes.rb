Rails.application.routes.draw do
  devise_for :users
  get 'accents/index'
  root to: "accents#index"
  resources :accents do
    resources :comments, only: :create
    resources :atamadakas, only: [:create, :destroy]
    resources :nakadakas, only: [:create, :destroy]
    resources :odakas, only: [:create, :destroy]

    collection do
      get 'search'
    end
  end
end
