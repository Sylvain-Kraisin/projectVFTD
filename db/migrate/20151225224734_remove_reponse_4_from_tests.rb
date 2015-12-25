class RemoveReponse4FromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :reponse_4, :string
  end
end
