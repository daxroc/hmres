class AddEndDateToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :end_date, :date
  end
end
