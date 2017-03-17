class Photo < ApplicationRecord
  belongs_to :gall
  has_one    :user, through: :galls
  mount_uploader :image, CarrierwaveUploader



end
