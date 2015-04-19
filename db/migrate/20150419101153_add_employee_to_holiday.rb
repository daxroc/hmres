class AddEmployeeToHoliday < ActiveRecord::Migration
  def change
    add_reference :holidays, :employee, index: true
    add_foreign_key :holidays, :employees
  end
end
