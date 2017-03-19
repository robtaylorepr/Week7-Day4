class Gall < ApplicationRecord
  belongs_to :user
  has_many   :photos, dependent: :destroy
  validates  :title, presence: true
  validates_uniqueness_of :title,
      scope: :user_id

end
