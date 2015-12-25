class RemoveNoteFromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :note, :integer
  end
end
