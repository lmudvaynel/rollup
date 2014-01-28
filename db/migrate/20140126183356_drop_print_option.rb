class DropPrintOption < ActiveRecord::Migration
	def change
		drop_table :print_options

		add_column :stand_options, :size, :string
    add_column :stand_options, :print_price, :string
  end
end
