require 'test_helper'

class DefaultControllerTest < ActionController::TestCase
  
  # D: Include Devise::TestHelpers
  include Devise::TestHelpers
  
  test "index" do
    assert_response :ok
  end
  
end