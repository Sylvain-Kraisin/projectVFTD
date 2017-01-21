class Visit < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  scope :anonymous, ->{where(user_id:nil)}
  scope :by_user, ->{where.not(user_id:nil)}

end
