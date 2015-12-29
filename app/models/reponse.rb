class Reponse < ActiveRecord::Base
belongs_to :test
belongs_to :user

  
  after_update :correction, only: [:update]



  validates :user_username, uniqueness: { scope: [:user_username, :test_id], message: "Tu as déjà passé ce DST !"}


  def correction
    UserMailer.correction(self).deliver_now
  end

end
