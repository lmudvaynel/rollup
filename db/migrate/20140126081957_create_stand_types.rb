class CreateStandTypes < ActiveRecord::Migration
  def change
    create_table :stand_types do |t|
    	t.string :name
    	t.string :slug
    	t.text :content
    	t.integer :stand_id
      t.boolean :hidden, default: false
      t.integer :position
    	

      t.timestamps
    end
  end
end
