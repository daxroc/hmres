require 'test_helper'

class HolidaysControllerTest < ActionController::TestCase
  
  # D: Include Devise::TestHelpers
  include Devise::TestHelpers
  
  setup do
    sign_in users(:jane)
    @holiday = holidays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:holidays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create holiday" do
    assert_difference('Holiday.count') do
      post :create, holiday: { :leave_date => "2015-04-19" }
    end

    assert_redirected_to holiday_path(assigns(:holiday))
  end

  test "should show holiday" do
    get :show, id: @holiday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @holiday
    assert_response :success
  end

  test "should update holiday" do
    patch :update, id: @holiday, holiday: { :leave_date => "2015-05-01" }
    assert_redirected_to holiday_path(assigns(:holiday))
  end

  test "should destroy holiday" do
    assert_difference('Holiday.count', -1) do
      delete :destroy, id: @holiday
    end

    assert_redirected_to holidays_path
  end
end
