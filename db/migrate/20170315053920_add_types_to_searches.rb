class AddTypesToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :typebill, :string
    add_column :searches, :compactor, :string
    add_column :searches, :rack, :string
    add_column :searches, :shelf, :string
  end
end
