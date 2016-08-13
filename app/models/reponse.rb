class Reponse < ActiveRecord::Base
belongs_to :test
belongs_to :user, dependent: :destroy

  #ne valide que les notes entre 0 et 4
  validates :note_1, inclusion: {in: 0..4, only_float: true, allow_blank: true}
  validates :note_2, inclusion: {in: 0..4, only_float: true, allow_blank: true}
  validates :note_3, inclusion: {in: 0..4, only_float: true, allow_blank: true}
  validates :note_4, inclusion: {in: 0..4, only_float: true, allow_blank: true}

  validates :reponse_1, length: { minimum: 2, maximum: 120 }
  validates :reponse_2, length: { minimum: 2, maximum: 120 }
  validates :reponse_3, length: { minimum: 2, maximum: 120 }
  validates :reponse_4, length: { minimum: 2, maximum: 120 }

  #un meme user ne peut creer 2 fois une reponse
  validates :user_username, uniqueness: { scope: [:user_username, :test_id], message: 'Tu as déjà passé ce DST !'}

  after_create :acorriger

  after_validation :update_total

  after_update :user_average, if: :total_changed?
  after_update :update_score, if: :total_changed?
  after_update :correction, if: :total_changed?


  def correction
    UserMailer.correction(self).deliver_later
  end

  def acorriger
    UserMailer.acorriger(self).deliver_later
  end


  #after_validation reponse.total s'update avec reponse.notes only si elles existents
  def update_total
    self.total = self.note_1 + self.note_2 + self.note_3 + self.note_4 if self.note_1 && self.note_2 && self.note_3 && self.note_4
  end

  def user_average
    user = User.where(username:self.user_username).first
    userreponse = Reponse.where(["total is NOT NULL"]).where(user_username: user.username)

    if userreponse.count >= 2
      user.update average:(userreponse.average(:total).round(2))
    end
  end

  def update_score
    user = User.where(username:self.user_username).first
    userreponse = Reponse.where(["total is NOT NULL"]).where(user_username: user.username)

    if user.average != nil
      user.update score:(((user.average * userreponse.count) * 1000) + user.bonus)
    end
  end


end
