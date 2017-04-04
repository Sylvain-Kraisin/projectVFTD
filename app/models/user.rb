class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :visits
  has_many :reponses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :want_new_post_email, ->{where(mail_new_post:true)}
  scope :want_new_test_email, ->{where(mail_new_test:true)}
  scope :want_correction_email, ->{where(mail_correction:true)}

  after_validation :add_bonus_to_score, if: :bonus_changed?
  before_create :set_default_score
  after_create :add_user_to_mailchimp_mailing_list
  after_commit :add_classroom, unless: :classroom?
  before_destroy :remove_user_from_mailchimp_list

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :in => 0.megabytes..1.megabytes

  validates :username,
    presence: true,
    uniqueness: {
    case_sensitive: false
    }
  validates :bio, length: {maximum: 2500}, allow_blank: true

  def is_admin?
    self.role == 'admin'
  end

  private

   def set_default_score
     self.score  ||= 0
   end

   def add_bonus_to_score
     self.score = ((average * self.reponses.where("total is NOT NULL").count) * 1000) + bonus
   end

  def add_user_to_mailchimp_mailing_list
    AddUserToMailchimpMailingListJob.perform_later(self)
  end

  def remove_user_from_mailchimp_list
    RemoveUserFromMailchimpMailingListJob.perform_later(self)
  end

  def add_classroom
    classrooms = ['Hanafuda', 'Game&Watch', 'DonkeyKong', 'Jumpman', 'Excitebike', 'DuckHunt', 'R.O.B',
      'Luigi', 'Metroid', 'Zelda', 'Link', 'Koopa', 'Wario', 'à définir']

    classrooms.size.times do |i|
      if User.where(classroom:classrooms[i]).count < 32
        self.classroom = classrooms[i]
        break
      end
    end
  end

end
