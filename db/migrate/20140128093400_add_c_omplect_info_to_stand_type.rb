class AddCOmplectInfoToStandType < ActiveRecord::Migration
  def change
  	remove_column :stand_options, :complect_info

  	add_column :stand_types, :complect_info, :string
  end
end
