Rails.application.routes.draw do
  devise_for :users

  get 'employees/profile', to: 'employees#profile'
  post 'employees/search', to: 'employees#search', as: :employee_search
  get 'holidays/approved/:id', to: 'holidays#approved', as: :holiday_approved
  get 'holidays/schedule', to: 'holidays#schedule', as: :holiday_schedule
  get 'holidays/queue', to: 'holidays#queue', as: :holiday_queue
  resources :employees
  resources :holidays
  resources :news
  
  root to: "default#index"
  
end
