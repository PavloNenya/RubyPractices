# frozen_string_literal: true
require 'nokogiri'
require 'httparty'

task :parse_data do
  response = HTTParty.get('https://www.nerdwallet.com/article/small-business/service-business-ideas')
  parsed_data = Nokogiri::HTML(response.body)

  # Опрацьовуйте та зберігайте бізнес-моделі в базу даних
  parsed_data.css('YOUR_CSS_SELECTOR').each do | item |
    # Обробка елементів та збереження їх у базу даних
  end
end
