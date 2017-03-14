class AddBundleToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :bundleno, :integer
  end
end
