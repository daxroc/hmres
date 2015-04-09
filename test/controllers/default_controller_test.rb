require 'test_helper'

class DefaultControllerTest < ActionController::TestCase
  
  test "index" do
    assert_response :ok
  end
  
end