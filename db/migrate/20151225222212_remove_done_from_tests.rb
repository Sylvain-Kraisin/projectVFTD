class RemoveDoneFromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :done, :boolean
  end
end
