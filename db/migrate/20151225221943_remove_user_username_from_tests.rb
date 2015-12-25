class RemoveUserUsernameFromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :user_username, :string
  end
end
