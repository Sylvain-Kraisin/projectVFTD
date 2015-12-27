class AddConsoleIdToTests < ActiveRecord::Migration
  def change
    add_column :tests, :console_id, :integer
  end
end
