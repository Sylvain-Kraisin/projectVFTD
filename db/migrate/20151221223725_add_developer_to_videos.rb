class AddDeveloperToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :developer, :string
  end
end
