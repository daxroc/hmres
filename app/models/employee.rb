class Employee < ActiveRecord::Base
  
  # Validation
  validates_presence_of :fname
  validates_presence_of :sname
  validates_presence_of :dob
  validates_presence_of :join_date
  validates_presence_of :sex
  validates :salary, numericality: { only_integer: true }
  
  has_one :user
  has_many :holidays
  
  def self.search_name(query)
    where("concat(fname, ', ', sname) LIKE ?", "%#{query}%" )
  end

  # Group by year #{column} cast returned float to integer - bammm!  
  def self.group_by_year(column)
    group("EXTRACT(YEAR FROM #{column})::int")
  end
  
  # Group by age #{column} cast returned float to integer - bammm!  
  def self.workforce_age()
    group("date_part('year', age(dob))::int")
  end
  
  
end
