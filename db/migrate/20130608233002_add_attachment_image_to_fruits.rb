class AddAttachmentImageToFruits < ActiveRecord::Migration
  def self.up
    change_table :fruits do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :fruits, :image
  end
end
