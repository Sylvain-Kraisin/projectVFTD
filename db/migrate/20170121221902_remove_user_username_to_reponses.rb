class RemoveUserUsernameToReponses < ActiveRecord::Migration
  def change
    remove_column :reponses, :user_username, :string
  end
end
