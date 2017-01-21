class ChangeUserIdFromVisits < ActiveRecord::Migration
  def change
    change_column :visits, :user_id, "integer USING user_id::integer"
  end
end
