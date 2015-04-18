class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :leave_date
      t.timestamps null: false
    end
  end
end
