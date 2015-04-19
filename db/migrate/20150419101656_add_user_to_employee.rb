class AddUserToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :user, index: true
    add_foreign_key :employees, :users
  end
end
