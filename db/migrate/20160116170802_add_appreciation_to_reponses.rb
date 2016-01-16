class AddAppreciationToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :appreciation, :string
  end
end
