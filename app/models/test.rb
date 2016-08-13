class Test < ActiveRecord::Base
  belongs_to :video
  belongs_to :console
  has_many :reponses

  validates :console_id, :video_id, :video_title, :question_1, :answer_1, :question_2, :answer_2, :question_3, :answer_3, :question_4, :answer_4, presence: true
  validates :video_id, uniqueness: { scope: [:video_id, :console_id], message: 'Il y a deja un DST pour cette vidéo !'}
end
