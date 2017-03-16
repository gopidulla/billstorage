class AddShelfToBills < ActiveRecord::Migration[5.0]
  def change
  	add_column :bills, :rock_id, :integer
    add_column :bills, :shelf_id, :integer
  end
end
