class AddUserUsernameToModels < ActiveRecord::Migration
  def change
    add_column :comments, :user_username, :string
    add_column :visits, :user_username, :string
  end
end
