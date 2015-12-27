class AddTotalToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :total, :float
  end
end
