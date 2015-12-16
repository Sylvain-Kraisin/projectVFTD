class AddLinkToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :link, :text
  end
end
