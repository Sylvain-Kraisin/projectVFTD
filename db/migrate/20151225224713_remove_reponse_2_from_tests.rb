class RemoveReponse2FromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :reponse_2, :string
  end
end
