Rails.application.routes.draw do
  get 'accents/index'
  root to: "accents#index"
end
