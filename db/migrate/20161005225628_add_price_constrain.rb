class AddPriceConstrain < ActiveRecord::Migration
  def change
  	add_index :prices, [:precio, :fecha], unique: true
  end
end
