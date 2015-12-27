class AddNote3ToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :note_3, :float
  end
end
