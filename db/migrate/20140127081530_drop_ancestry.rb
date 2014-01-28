class DropAncestry < ActiveRecord::Migration
	def change
		add_column :stand_types, :parent_id, :integer
	end
end
