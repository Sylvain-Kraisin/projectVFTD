class Video < ActiveRecord::Base
  include AASM

  belongs_to :console
  has_one :test, dependent: :destroy

  validates :title, :console_id, :link, :style, :release, :genre, :player, :developer, :video_img, presence: true

  has_attached_file :video_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :video_img, content_type: /\Aimage\/.*\Z/

  aasm do
    state :draft, initial: true
    state :online

    event :run do
      transitions from: :draft, to: :online
      success do
        User.want_new_test_email.each do |user|
          UserMailer.new_test_available(self, user).deliver_now
        end
      end
    end
  end

end
