# app/models/business_model.rb

class BusinessModel < ApplicationRecord
  validates :name, presence: true
  validates :index, presence: true, numericality: { only_integer: true }
  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end
  # Add any associations here if needed
end
