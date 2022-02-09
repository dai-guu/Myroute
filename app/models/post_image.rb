class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image

  validates :shop_name, presence: true
  validates :image, presence: true
  validates :caption, presence: true,
            length: { maximum: 200 }

  geocoded_by :address
  after_validation :geocode

  has_many :post_comments, dependent: :destroy

end
