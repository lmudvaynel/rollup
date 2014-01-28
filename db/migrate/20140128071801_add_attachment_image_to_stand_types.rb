class AddAttachmentImageToStandTypes < ActiveRecord::Migration
  def self.up
    change_table :stand_types do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :stand_types, :image
  end
end
