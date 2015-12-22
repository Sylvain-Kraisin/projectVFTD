class AddReleaseToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :release, :date
  end
end
