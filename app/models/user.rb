class User < ApplicationRecord
  has_many  :galls
  has_many  :photos, through: :galls
  validates :name, presence: true
  has_secure_password
  
end
