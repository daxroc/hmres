Rails.application.routes.draw do
  devise_for :users

  get 'employees/profile', to: 'employees#profile'
  resources :employees
  
  root to: "default#index"
  
end
