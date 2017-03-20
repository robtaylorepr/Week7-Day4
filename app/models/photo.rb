class Photo < ApplicationRecord
  attr_accessor :hit_me
  belongs_to :gall
  has_one    :user, through: :galls
  mount_uploader :image, CarrierwaveUploader

  def is_owner?(this_user)
    user == this_user
  end

end
