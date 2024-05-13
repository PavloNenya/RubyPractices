require 'httparty'

class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { message: "already has a profile" }
  validates :name, :surname, :fatherly, :date_of_birth, :telephone, presence: true

  validates :gender, inclusion: { in: %w(male female), message: "must be either male or female" }
  validates :currency, presence: true

  def exchange_rate_to_usd
    return 1 if currency == 'UAH'
    response = HTTParty.get("https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5")
    exchange_rates = JSON.parse(response.body)
    currency_rate = exchange_rates.find { |rate| rate["ccy"] == currency }
    currency_rate ? currency_rate["buy"].to_f : nil
  rescue StandardError => e
    Rails.logger.error("Error fetching exchange rate: #{e.message}")
    nil
  end
end
