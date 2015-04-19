Rails.application.routes.draw do
  devise_for :users

  get 'employees/profile', to: 'employees#profile'
  get 'holidays/approved/:id', to: 'holidays#approved', as: :holiday_approved
  resources :employees
  resources :holidays
  
  root to: "default#index"
  
end
