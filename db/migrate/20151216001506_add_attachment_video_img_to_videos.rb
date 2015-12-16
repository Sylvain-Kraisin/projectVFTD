class AddAttachmentVideoImgToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :video_img
    end
  end

  def self.down
    remove_attachment :videos, :video_img
  end
end
