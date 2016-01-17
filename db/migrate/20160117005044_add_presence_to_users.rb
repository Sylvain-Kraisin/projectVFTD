class AddPresenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :presence, :integer
  end
end
