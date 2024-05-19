class Poster < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :payments

  mount_uploader :picture, PictureUploader
  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end
  def busy_day?(date)
    payments.exists?(date: date)
  end
end
