class AddYearToSearches < ActiveRecord::Migration[5.0]
  def change
  	change_column :searches, :month, :string
  	add_column :searches, :year, :string
  end
end
