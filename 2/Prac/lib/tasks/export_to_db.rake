require 'nokogiri'
require 'open-uri'
require 'csv'
require 'mechanize'

namespace :parse do
  task :export => :environment do
    # URL сайту, який буде парситися
    url = 'https://www.nerdwallet.com/article/small-business/service-business-ideas'

    # Ініціалізація об'єкта Mechanize для взаємодії з веб-сторінкою
    agent = Mechanize.new
    page = agent.get(url)
    doc = Nokogiri::HTML(page.body)

    # Парсинг даних і збереження їх у масив
    elements = doc.css('div._3VJt4n ol._2vAAlI li._134slX._2C6PLy.tbvJKO')

    # Задання індексу, з якого почнеться запис
    start_index = 15  # 16-й елемент (починається з 0)

      id = 0

      # Перехід до елементів, починаючи з 16-го
      elements[start_index..-1].each do |element|
        begin
          # Отримання тексту з тегу <span>
          data1 = element.css('span').text.strip

          # Завантаження даних у БД
          BuisnessIdea.create(name:data1, id:id+=1)
        rescue StandardError => e
          # Обробка можливих помилок і виведення повідомлення
          puts "Помилка при обробці елемента: #{e.message}"
        end
    end
  end
end