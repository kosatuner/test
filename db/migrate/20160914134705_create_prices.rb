class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :precio
      t.date :fecha
      t.references :stock, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
