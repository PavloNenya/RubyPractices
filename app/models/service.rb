# app/models/service.rb
class Service < ApplicationRecord
  validates :name, presence: true
  validates :description, allow_blank: true, length: { maximum: 255 }
  has_many :posters
  has_many :chose_us
  has_many :chose_ps
  has_many :interests
end
