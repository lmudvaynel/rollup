class CreateStands < ActiveRecord::Migration
  def change
    create_table :stands do |t|
    	t.string :name
    	t.string :slug
    	t.text :content
    	t.boolean :hidden, default: false
    	t.integer :position

      t.timestamps
    end
  end
end
