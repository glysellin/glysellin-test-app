class AddAttachmentImageToVegetables < ActiveRecord::Migration
  def self.up
    change_table :vegetables do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :vegetables, :image
  end
end
