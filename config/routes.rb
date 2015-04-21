Rails.application.routes.draw do
  devise_for :users

  get 'employees/profile', to: 'employees#profile'
  post 'employees/search', to: 'employees#search', as: :employee_search
  get 'holidays/approved/:id', to: 'holidays#approved', as: :holiday_approved
  get 'holidays/schedule', to: 'holidays#schedule', as: :holiday_schedule
  get 'holidays/queue', to: 'holidays#queue', as: :holiday_queue
  get 'news/list', to: 'news#list', as: :news_list
  
  # D: Route statisitics to default controller
  get 'statistics', to: 'default#statistics'
  get 'statistics/employee_join_by_year', to: 'default#employee_join_by_year', as: :chart_join_by_year
  get 'statistics/employee_by_year', to: 'default#employee_by_age', as: :chart_by_age
  
  resources :employees
  resources :holidays
  resources :news
  
  root to: "default#index"
  
end
