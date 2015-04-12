Rails.application.routes.draw do
  devise_for :users

  resources :employees

  root to: "default#index"
end
