class AddAttachmentAvatarToMicroposts < ActiveRecord::Migration
  def self.up
 add_attachment :microposts, :avatar
  end

  def self.down
    drop_attached_file :microposts, :avatar
  end
end
