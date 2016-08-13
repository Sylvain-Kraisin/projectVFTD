class Category < ActiveRecord::Base
  has_many :posts

  validates :name, uniqueness: true
end
