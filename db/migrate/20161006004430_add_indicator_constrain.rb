class AddIndicatorConstrain < ActiveRecord::Migration
  def change
  	add_index :indicators, [:fecha, :stock_id, :indicator_type_id], unique: true
  end
end
