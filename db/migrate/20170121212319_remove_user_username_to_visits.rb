class RemoveUserUsernameToVisits < ActiveRecord::Migration
  def change
    remove_column :visits, :user_username, :string
  end
end
