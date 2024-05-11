# app/models/business_model.rb

class BusinessModel < ApplicationRecord
  validates :name, presence: true
  validates :index, presence: true, numericality: { only_integer: true }

  # Add any associations here if needed
end
