class User < ActiveRecord::Base
  has_many :visits
  has_many :comments
  has_many :tests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
    :presence => true,
    :uniqueness => {
    :case_sensitive => false
    }
end
