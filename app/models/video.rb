class Video < ActiveRecord::Base
  belongs_to :console
  has_one :test, dependent: :destroy

  validates :title, :console_id, :link, :style, :release, :genre, :player, :developer, presence: true

  has_attached_file :video_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :video_img, content_type: /\Aimage\/.*\Z/
end
