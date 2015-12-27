class Test < ActiveRecord::Base
  belongs_to :video
  has_many :reponses
end
