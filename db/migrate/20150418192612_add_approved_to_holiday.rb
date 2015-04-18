class AddApprovedToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :approved, :boolean, :default => false
  end
end
