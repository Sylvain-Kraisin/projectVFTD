class Post < ActiveRecord::Base
  belongs_to :category

  has_attached_file :post_img, styles: { post_index: "250x350>", post_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/
end
