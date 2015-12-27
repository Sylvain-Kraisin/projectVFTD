class AddNote2ToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :note_2, :float
  end
end
