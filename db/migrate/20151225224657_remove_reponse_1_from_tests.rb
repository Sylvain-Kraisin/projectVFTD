class RemoveReponse1FromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :reponse_1, :string
  end
end
