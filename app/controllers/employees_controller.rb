class EmployeesController < ApplicationController
  
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :profile]
  before_action :authenticate_user!
  before_filter :ensure_admin!, except: [:profile]
  
  # GET /employees
  # GET /employees.json
  def index
    #@employees = Employee.all
    @employees = Employee.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end
  
  # POST /employee/search
  def search
    # D: Custom search method on model searches concatinated 
    # D: sname, fname for keyword like match
    @employees = Employee.paginate(:page => params[:page], :per_page => 10).search_name(params[:keywords])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /employees/profile
  def profile
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      # D: Use the provided param if set else default to current user id
      @employee = Employee.find(params[:id] || current_user.employee_id)
    end

    # Never trust parameters from the scary internet, 
    # only allow the white list through
    # D: So lame... rails explodes chickens when not white listed
    def employee_params
      params[:employee]
        .permit(
          :id, 
          :fname, 
          :sname, 
          :dob, 
          :salary, 
          :join_date,
          :end_date, 
          :sex,
          :keywords
        )
    end
end
