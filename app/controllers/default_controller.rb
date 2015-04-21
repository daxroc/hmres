class DefaultController < ApplicationController

    before_action :authenticate_user!, only: [:statistics, :employee_by_age, :employee_join_by_year]
    before_filter :ensure_admin!, only: [:statistics, :employee_by_age, :employee_join_by_year]

    def index
    end
    
    def statistics
    end
    
    def employee_join_by_year
       render json: Employee.group_by_year('join_date').count.chart_json 
    end
    
    def employee_by_age
       render json: Employee.workforce_age.count.chart_json 
    end
    
    
end
