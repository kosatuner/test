class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
