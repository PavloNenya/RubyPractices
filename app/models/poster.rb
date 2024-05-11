class Poster < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :payments

  def busy_day?(date)
    payments.exists?(date: date)
  end
end
