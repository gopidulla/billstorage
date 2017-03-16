class CreateShelves < ActiveRecord::Migration[5.0]
  def change
    create_table :shelves do |t|
      t.string :name
      t.integer :rock_id

      t.timestamps
    end
  end
end
