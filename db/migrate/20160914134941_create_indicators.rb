class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.float :valor
      t.date :fecha
      t.string :signal
      t.references :stock #index: true, foreign_key: true
      t.references :indicatortype#, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
