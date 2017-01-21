class RemoveUserUsernameToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :user_username, :string
  end
end
