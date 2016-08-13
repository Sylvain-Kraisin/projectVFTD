class Console < ActiveRecord::Base
  has_many :videos
  has_many :tests, through: :videos

  validates :title,
    presence: true,
    uniqueness: {
    case_sensitive: false
    }

  has_attached_file :console_img, styles: { medium: "256x256>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :console_img, content_type: /\Aimage\/.*\Z/
end
