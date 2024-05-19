# app/models/service.rb
class Service < ApplicationRecord
  validates :name, presence: true
  validates :description, allow_blank: true, length: { maximum: 255 }
  has_many :posters
  has_many :chose_us
  has_many :chose_ps
  has_many :interests

  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end
end
