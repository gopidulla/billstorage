class AddIdToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :section_id, :integer
    add_column :bills, :typebill_id, :integer
  end
end
