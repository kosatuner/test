class CreateHasIndicatorTypers < ActiveRecord::Migration
  def change
    create_table :has_indicator_typers do |t|
      t.references :stock, index: true, foreign_key: true
      t.references :indicator_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
