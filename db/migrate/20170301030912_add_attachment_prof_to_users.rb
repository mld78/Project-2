class AddAttachmentProfToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :prof
    end
  end

  def self.down
    remove_attachment :users, :prof
  end
end
