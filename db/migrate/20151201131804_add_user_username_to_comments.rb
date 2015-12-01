class AddUserUsernameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_username, :string
  end
end
