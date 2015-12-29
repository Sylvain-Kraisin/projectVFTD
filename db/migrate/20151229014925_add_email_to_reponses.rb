class AddEmailToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :email, :string
  end
end
