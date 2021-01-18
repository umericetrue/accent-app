Rails.application.routes.draw do
  devise_for :users
  get 'accents/index'
  root to: "accents#index"
  resources :accents do
    resources :atamadakas, only: [:create, :destroy]
  end
end
