class Reponse < ActiveRecord::Base
belongs_to :test
belongs_to :user

  validates :note_1, :inclusion => {:in => 1..4, :only_integer => true, :allow_blank => true}

  after_update :correction, :if => :total_changed?
  after_create :acorriger

  @bigtotal = Reponse.all.map { |reponse| reponse.total }

  after_validation :update_total


  validates :user_username, uniqueness: { scope: [:user_username, :test_id], message: "Tu as déjà passé ce DST !"}



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

  def update_total
    self.total = self.note_1 + self.note_2 + self.note_3 + self.note_4 if self.note_1 && self.note_2 && self.note_3 && self.note_4
 end


end
