class Post < ActiveRecord::Base
  belongs_to :category
  has_many :visits
  has_many :comments, dependent: :destroy

  has_attached_file :post_img, styles: { post_index: "180x216>", post_show: "90x108>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/
end
