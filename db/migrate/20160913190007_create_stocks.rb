class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :nombre
      t.string :descripcion
      t.references :market, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
