class News < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :body
  
  belongs_to :employee
  
end
