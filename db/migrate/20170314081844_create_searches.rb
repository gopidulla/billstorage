class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.date :month
      t.string :dvno

      t.timestamps
    end
  end
end
