class AddGenreToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :genre, :string
  end
end
