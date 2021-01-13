Rails.application.routes.draw do
  get 'accents/index'
  root to: "accents#index"
  resources :accents, only: [:index, :new, :show]
end
