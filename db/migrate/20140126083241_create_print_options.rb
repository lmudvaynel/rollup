class CreatePrintOptions < ActiveRecord::Migration
  def change
    create_table :print_options do |t|
    	t.string :size
    	t.string :print_price
    	t.integer :stand_type_id
    	
      t.timestamps
    end
  end
end
