class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :ensure_admin!, only: [:delete]

  # GET /holidays
  # GET /holidays.json
  def index
    @holidays = Holiday.where( :employee_id => current_user.employee_id )
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
  end

  # GET /holidays/new
  def new
    @holiday = Holiday.new
  end

  # GET /holidays/1/edit
  def edit
  end
  
  # GET /holidays/schedule
  def schedule
    @holidays = Holiday.where(:approved => true)
  end
  
  # GET /holidays/schedule
  def queue
    @holidays = Holiday.where(:approved => false)
  end
  
  # PATCH/PUT /holidays/approved/1
  # PATCH/PUT /holidays/approved/1.json
  def approved
    respond_to do |format|
      holiday_update = Holiday.find( params[:id] )
      holiday_update.approved = !holiday_update.approved
      if holiday_update.save
        format.html { redirect_to holidays_path, notice: 'Holiday was successfully approved.' }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { redirect_to @holiday, notice: 'Failed to approve holiday' }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = Holiday.new(holiday_params)
    
    # D: Force new holidays to belong_to current user
    @holiday.employee_id = current_user.employee_id

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to @holiday, notice: 'Holiday was successfully created.' }
        format.json { render :show, status: :created, location: @holiday }
      else
        format.html { render :new }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holidays/1
  # PATCH/PUT /holidays/1.json
  def update
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to @holiday, notice: 'Holiday was successfully updated.' }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy
    respond_to do |format|
      format.html { redirect_to holidays_url, notice: 'Holiday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holiday_params
      params[:holiday]
        .permit(
          :id,
          :leave_date,
          :user_id,
          :approved
        )
    end
end
