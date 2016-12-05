class CreateIndicatorTypes < ActiveRecord::Migration
  def change
    create_table :indicator_types do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
