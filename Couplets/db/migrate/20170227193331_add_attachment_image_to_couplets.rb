class AddAttachmentImageToCouplets < ActiveRecord::Migration
  def self.up
    change_table :couplets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :couplets, :image
  end
end
