class Post < ActiveRecord::Base
  include AASM
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :user
  has_many :visits
  has_many :comments, dependent: :destroy

  validates :title, :content, :category_id, presence: true
  validates :title, length: { minimum: 5, maximum: 50 }

  has_attached_file :post_img, styles: { post_index: "180x216>", post_show: "90x108>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/

  aasm do
    state :draft, initial: true
    state :pending
    state :published

    event :submit do
      transitions from: :draft, to: :pending
      success do
        UserMailer.new_post_request(self, self.user).deliver_later
      end
    end


    event :refuse do
      transitions from: :pending, to: :draft
      success do
        UserMailer.post_refused(self, self.user).deliver_later
      end
    end

    event :accept do
      transitions from: :pending, to: :published
      success do
        user = self.user
        user.update bonus:user.bonus + 200
        User.find_each do |user|
          next unless user.mail_new_post?
          UserMailer.new_post_available(self, user).deliver_later
        end
      end
    end
  end
end
