class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { message: "already has a profile" }
  validates :name, :surname, :fatherly, :date_of_birth, :telephone, presence: true

  validates :gender, inclusion: { in: %w(male female), message: "must be either male or female" }
end
