class AddNote1ToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :note_1, :float
  end
end
