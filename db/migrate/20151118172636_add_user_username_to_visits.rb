class AddUserUsernameToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :user_username, :string
  end
end
