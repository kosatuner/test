class ChangeIndicatorTypeReferences < ActiveRecord::Migration
  def change
  	#remove_column :indicators, :indicatortype_id, :integer
  	#remove_column :indicators, :indicator_type, :integer
  	#remove_column :indicators, :indicatortype, :integer
  	
  	add_column :indicators, :indicator_type_id, :integer
  end
end
