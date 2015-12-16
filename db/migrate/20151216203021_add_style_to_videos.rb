class AddStyleToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :style, :string
  end
end
