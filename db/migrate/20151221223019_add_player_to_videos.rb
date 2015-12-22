class AddPlayerToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :player, :string
  end
end
