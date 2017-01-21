class AddUserIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :user_id, :string
  end
end
