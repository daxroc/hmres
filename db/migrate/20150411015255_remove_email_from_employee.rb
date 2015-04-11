class RemoveEmailFromEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :email, :string
  end
end
