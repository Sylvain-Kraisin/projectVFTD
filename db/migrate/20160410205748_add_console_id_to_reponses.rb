class AddConsoleIdToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :console_id, :integer
  end
end
