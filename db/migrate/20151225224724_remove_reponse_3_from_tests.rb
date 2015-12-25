class RemoveReponse3FromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :reponse_3, :string
  end
end
