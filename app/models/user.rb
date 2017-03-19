class User < ApplicationRecord
  has_many  :galls, dependent: :destroy
  has_many  :photos, through: :galls
  validates :name,  presence: true,
                    uniqueness: true
  validates :email, presence: true
  has_secure_password

end
