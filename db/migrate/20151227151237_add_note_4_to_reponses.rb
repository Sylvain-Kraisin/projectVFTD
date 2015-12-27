class AddNote4ToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :note_4, :float
  end
end
