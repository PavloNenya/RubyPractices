class Favorite < ApplicationRecord
  belongs_to :poster
  belongs_to :user
end
