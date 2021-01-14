Rails.application.routes.draw do
  devise_for :users
  get 'accents/index'
  root to: "accents#index"
  resources :accents, only: [:index, :new, :show, :create]
end
