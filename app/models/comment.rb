class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :content, presence: {}

  after_create :notify_author

  def notify_author
    if self.user_id != self.post.user_id
      if self.post.user.present?
        UserMailer.notify_author(self).deliver_later
      end
    end
  end
end
