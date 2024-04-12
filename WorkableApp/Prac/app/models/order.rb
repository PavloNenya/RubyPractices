class Order < ApplicationRecord
  belongs_to :account
  belongs_to :poster
end
