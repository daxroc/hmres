class AddEmployeeToNews < ActiveRecord::Migration
  def change
    add_reference :news, :employee, index: true
    add_foreign_key :news, :employees
  end
end
