require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  should validate_presence_of(:fname)
  should validate_presence_of(:sname)
  should validate_presence_of(:dob)
  should validate_presence_of(:join_date)
  should validate_presence_of(:sex)
  should validate_numericality_of(:salary).only_integer
  
  should have_one(:user)
  
end
