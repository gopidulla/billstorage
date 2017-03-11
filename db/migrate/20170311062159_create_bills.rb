class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :section
      t.string :dvno
      t.date :month
      t.string :typebill
      t.string :compactor
      t.string :rack
      t.string :shelf

      t.timestamps
    end
  end
end
