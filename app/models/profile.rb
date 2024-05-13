require 'httparty'

class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { message: "already has a profile" }
  validates :name, :surname, :fatherly, :date_of_birth, :telephone, presence: true

  validates :gender, inclusion: { in: %w(male female), message: "must be either male or female" }
  validates :currency, presence: true

  def exchange_rate_to_usd
    return 1 if currency == 'USD'

    response = HTTParty.get("https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5")
    exchange_rates = JSON.parse(response.body)
    usd_rate = exchange_rates.find { |rate| rate["ccy"] == 'USD' }
    currency_rate = exchange_rates.find { |rate| rate["base_ccy"] == 'UAH' || rate["ccy"] == currency }

    if usd_rate && currency_rate
      usd_to_uah = usd_rate["sale"].to_f
      currency_to_uah = currency_rate["sale"].to_f

      # for UAH
      if currency == 'UAH'
        exchange_rate = 1 / usd_to_uah
      else
        exchange_rate = currency_to_uah / usd_to_uah
      end

      return exchange_rate
    else
      return nil
    end
  rescue StandardError => e
    Rails.logger.error("Error fetching exchange rate: #{e.message}")
    nil
  end
end
