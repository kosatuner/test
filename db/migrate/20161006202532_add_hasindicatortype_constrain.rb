class AddHasindicatortypeConstrain < ActiveRecord::Migration
  def change
  	add_index :has_indicator_typers, [:stock_id, :indicator_type_id], unique: true
  end
end
