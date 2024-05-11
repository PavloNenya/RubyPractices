# app/models/service.rb
class Service < ApplicationRecord
  validates :name, presence: true
  has_many :posters
  has_many :chose_us
  has_many :chose_ps
end
