class CreateStandBenefits < ActiveRecord::Migration
  def change
    create_table :stand_benefits do |t|
    	t.string :title
    	t.text :content
    	t.integer :stand_type_id

      t.timestamps
    end
  end
end
