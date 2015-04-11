class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :sname
      t.string :email
      t.date :dob
      t.date :join_date
      t.integer :salary

      t.timestamps null: false
    end
  end
end
