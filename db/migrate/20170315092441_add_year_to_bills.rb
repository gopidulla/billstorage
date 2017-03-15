class AddYearToBills < ActiveRecord::Migration[5.0]
  def change
  	change_column :bills, :month, :string
  	add_column :bills, :year, :string
  end
end
