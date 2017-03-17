class Gall < ApplicationRecord
  belongs_to :user
  has_many   :photos
  validates   :title, uniqueness: true

end
