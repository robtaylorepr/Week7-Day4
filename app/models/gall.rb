class Gall < ApplicationRecord
  belongs_to :user
  has_many   :photos, dependent: :destroy
  validates  :title, presence: true
  validates_uniqueness_of :title,
      scope: :user_id

    def is_owner?(this_user)
      user == this_user
    end

end
