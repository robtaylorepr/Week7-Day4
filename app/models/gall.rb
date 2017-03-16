class Gall < ApplicationRecord
  belongs_to :user
  has_many   :photos
  validates   :title
  validates   :description
  
end
