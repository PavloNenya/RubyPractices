class Group < ApplicationRecord
  belongs_to :interest
  has_many :group_memberships
  has_many :users, through: :group_memberships

  validates :name, presence: true
end
