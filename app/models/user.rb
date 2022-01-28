class User < ApplicationRecord
  has_secure_password
  has_many :post_images, dependent: :destroy
  attachment :profile_image
end
