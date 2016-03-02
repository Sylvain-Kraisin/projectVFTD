class Reponse < ActiveRecord::Base
belongs_to :test
belongs_to :user

  #ne valide que les notes entre 0 et 4
  validates :note_1, :inclusion => {:in => 0..4, :only_float => true, :allow_blank => true}
  validates :note_2, :inclusion => {:in => 0..4, :only_float => true, :allow_blank => true}
  validates :note_3, :inclusion => {:in => 0..4, :only_float => true, :allow_blank => true}
  validates :note_4, :inclusion => {:in => 0..4, :only_float => true, :allow_blank => true}

  #un meme user ne peut creer 2 fois une reponse
  validates :user_username, uniqueness: { scope: [:user_username, :test_id], message: "Tu as déjà passé ce DST !"}

  after_validation :update_total

  after_update :correction, :if => :total_changed?

  after_create :acorriger

  #mis de coté pour l'instant
  #@bigtotal = Reponse.all.map { |reponse| reponse.total }


  def correction
    UserMailer.correction(self).deliver_later
  end

  def acorriger
    UserMailer.acorriger(self).deliver_later
  end

  def moyenne
    @goodreponses = Reponse.where("total is NOT NULL")
    @arraygoodtotal = @goodreponses.map { |reponse| reponse.total }
  end

  #after_validation reponse.total s'update avec reponse.notes only si elles existents
  def update_total
    self.total = self.note_1 + self.note_2 + self.note_3 + self.note_4 if self.note_1 && self.note_2 && self.note_3 && self.note_4
  end


end
