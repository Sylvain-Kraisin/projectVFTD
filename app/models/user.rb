class User < ActiveRecord::Base
  before_create :set_default_score
  has_many :visits
  has_many :comments
  has_many :reponses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  after_validation :add_bonus_to_score, if: :bonus_changed?
  after_create :add_user_to_mailchimp_mailing_list
  after_commit :add_classroom, unless: :classroom?

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :in => 0.megabytes..1.megabytes



  validates :username,
    presence: true,
    uniqueness: {
    case_sensitive: false
    }
  validates :bio, length: {maximum: 2500}, allow_blank: true

  private

   def set_default_score
     self.score  ||= 0
     #self.score = true if self.score.nil?
   end

   def add_bonus_to_score
     self.score = ((average * self.reponses.where("total is NOT NULL").count) * 1000) + bonus
   end

  def add_user_to_mailchimp_mailing_list
    User.first(100).offset(100).each do |user|
      AddUserToMailchimpMailingListJob.perform_later(user)
    end
  end

  def add_classroom
    if User.order(created_at: :asc).limit(32).pluck(:id).include? self.id
      self.classroom = 'Hanafuda'
      save
    elsif User.order(created_at: :asc).offset(32).limit(32).pluck(:id).include? self.id
      self.classroom = 'Game&Watch'
      save
    elsif User.order(created_at: :asc).offset(64).limit(32).pluck(:id).include? self.id
      self.classroom = 'DonkeyKong'
      save
    elsif User.order(created_at: :asc).offset(96).limit(32).pluck(:id).include? self.id
      self.classroom = 'Jumpman'
      save
    elsif User.order(created_at: :asc).offset(128).limit(32).pluck(:id).include? self.id
      self.classroom = 'Excitebike'
      save
    elsif User.order(created_at: :asc).offset(160).limit(32).pluck(:id).include? self.id
      self.classroom = 'DuckHunt'
      save
    elsif User.order(created_at: :asc).offset(192).limit(32).pluck(:id).include? self.id
      self.classroom = 'R.O.B'
      save
    elsif User.order(created_at: :asc).offset(224).limit(32).pluck(:id).include? self.id
      self.classroom = 'Luigi'
      save
    elsif User.order(created_at: :asc).offset(256).limit(32).pluck(:id).include? self.id
      self.classroom = 'Metroid'
      save
    elsif User.order(created_at: :asc).offset(288).limit(32).pluck(:id).include? self.id
      self.classroom = 'Zelda'
      save
    elsif User.order(created_at: :asc).offset(320).limit(32).pluck(:id).include? self.id
      self.classroom = 'Link'
      save
    elsif User.order(created_at: :asc).offset(352).limit(32).pluck(:id).include? self.id
      self.classroom = 'Koopa'
      save
    else
      self.classroom = 'à définir'
    end
  end

end
