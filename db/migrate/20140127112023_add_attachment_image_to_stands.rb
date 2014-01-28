class AddAttachmentImageToStands < ActiveRecord::Migration
  def self.up
    change_table :stands do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :stands, :image
  end
end
