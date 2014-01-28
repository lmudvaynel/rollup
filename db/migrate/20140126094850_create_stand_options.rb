class CreateStandOptions < ActiveRecord::Migration
  def change
    create_table :stand_options do |t|
    	t.string :complect_info
    	t.string :stand_price
    	t.integer :stand_type_id

      t.timestamps
    end
  end
end
