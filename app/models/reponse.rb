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

  #un meme user ne peut creer 2 fois une reponse avec le meme test_id
  validates :user_id, uniqueness: { scope: [:user_id, :test_id], message: 'Tu as déjà passé ce DST !'}

  after_create :acorriger

  after_validation :update_total

  after_update :user_average, if: :total_changed?
  after_update :update_score, if: :total_changed?
  after_update :correction, if: :total_changed?


  def correction
    if self.user.mail_correction?
      UserMailer.correction(self).deliver_later
    end
  end

  def acorriger
    UserMailer.acorriger(self).deliver_later
  end


  #after_validation reponse.total s'update avec reponse.notes only si elles existents
  def update_total
    self.total = self.note_1 + self.note_2 + self.note_3 + self.note_4 if self.note_1 && self.note_2 && self.note_3 && self.note_4
  end

  def user_average
    users_reponses = self.user.reponses.where(["total is NOT NULL"])

    if users_reponses.count >= 2
      user.update average:(users_reponses.average(:total).round(2))
    end
  end

  def update_score
    user = self.user
    reponses_count = user.reponses.where(["total is NOT NULL"]).count

    if user.average != nil
      user.update score:(((user.average * reponses_count ) * 1000) + user.bonus)
    end
  end


end
