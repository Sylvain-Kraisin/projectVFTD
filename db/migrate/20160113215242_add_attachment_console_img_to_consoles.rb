class AddAttachmentConsoleImgToConsoles < ActiveRecord::Migration
  def self.up
    change_table :consoles do |t|
      t.attachment :console_img
    end
  end

  def self.down
    remove_attachment :consoles, :console_img
  end
end
