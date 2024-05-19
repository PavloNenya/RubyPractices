class Payment < ApplicationRecord
  belongs_to :poster
  belongs_to :user

  validates :poster_id, presence: true
  validates :user_id, presence: true

  # Add validation to ensure that payment date is unique for a poster
  validates_uniqueness_of :date, scope: [:poster_id]

  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end
end
