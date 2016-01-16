class User < ActiveRecord::Base
  has_many :visits
  has_many :comments
  has_many :reponses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :in => 0.kilobytes..1000.kilobytes

  validates :username,
    :presence => true,
    :uniqueness => {
    :case_sensitive => false
    }
end
