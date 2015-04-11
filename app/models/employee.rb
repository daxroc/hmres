class Employee < ActiveRecord::Base
  
  # Validation
  validates_presence_of :fname
  validates_presence_of :sname
  validates_presence_of :dob
  validates_presence_of :join_date
  validates_presence_of :sex
  validates :salary, numericality: { only_integer: true }
  
  has_one :user
  
end
