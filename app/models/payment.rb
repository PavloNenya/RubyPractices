class Payment < ApplicationRecord
  belongs_to :poster
  belongs_to :user

  validates :poster_id, presence: true
  validates :user_id, presence: true

  # Add validation to ensure that payment date is unique for a poster
  validates_uniqueness_of :date, scope: [:poster_id]
end
