class Holiday < ActiveRecord::Base
  
  validates_presence_of :leave_date
  
  belongs_to :user
  
end
