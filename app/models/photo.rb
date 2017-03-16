class Photo < ApplicationRecord
  belongs_to :galls
  belongs_to :user, through: :galls
end
