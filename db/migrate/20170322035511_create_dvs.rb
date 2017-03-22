class CreateDvs < ActiveRecord::Migration[5.0]
  def change
    create_table :dvs do |t|
      t.string :dvno
      t.belongs_to :bill, foreign_key: true

      t.timestamps
    end
  end
end
