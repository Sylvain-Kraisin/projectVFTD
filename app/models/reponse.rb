class Reponse < ActiveRecord::Base
  validates :user_username, uniqueness: { scope: [:user_username, :test_id], message: "Tu as déjà passé ce DST !"}

end
