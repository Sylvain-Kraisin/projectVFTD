class Test < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  validates :reponse_1, presence: {}
  validates :reponse_2, presence: {}
  validates :reponse_3, presence: {}
  validates :reponse_4, presence: {}
end
