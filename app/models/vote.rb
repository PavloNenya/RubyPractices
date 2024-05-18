class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  belongs_to :poster

  validates :user_id, uniqueness: true
end
