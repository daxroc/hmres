Rails.application.routes.draw do
  devise_for :users

  get 'employees/profile', to: 'employees#profile'
  resources :employees
  resources :holidays
  
  root to: "default#index"
  
end
