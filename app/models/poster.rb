class Poster < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :payments
  has_many :votes
  mount_uploader :picture, PictureUploader

  def busy_day?(date)
    payments.exists?(date: date)
  end
end
