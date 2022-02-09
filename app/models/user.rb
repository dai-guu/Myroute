class User < ApplicationRecord
  has_secure_password
  has_many :post_images, dependent: :destroy
  attachment :profile_image

  has_many :post_comments, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, length: {maximum: 20, minimum: 2}


  def active_for_authentication?
    super && (is_deleted == false)
  end
end
