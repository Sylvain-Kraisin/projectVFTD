class AddUserIdToReponses < ActiveRecord::Migration
  def change
    add_column :reponses, :user_id, :integer
  end
end
