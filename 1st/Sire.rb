require 'nokogiri'
require 'open-uri'
require 'csv'
require 'mechanize'

# URL сайту, який буде парситися
url = 'https://www.nerdwallet.com/article/small-business/service-business-ideas'

# Ініціалізація об'єкта Mechanize для взаємодії з веб-сторінкою
agent = Mechanize.new
page = agent.get(url)
doc = Nokogiri::HTML(page.body)

# Визначення назви та місця CSV-файлу для зберігання результатів
csv_filename = '2 semestr/PR1(parsing)/results.csv'

# Відкриття CSV-файлу для запису результатів парсингу
CSV.open(csv_filename, 'w') do |csv|
  # Додавання заголовка CSV з іменами стовпців
  csv << %w[Name ID] # Заголовки

  # Хеш для елементів, що вже зустрічалися
  seen_elements = {}
  # ID
  id = 0

  # Парсинг даних і додавання їх у CSV-файл
  doc.css('div._3VJt4n ol._2vAAlI li._134slX._2C6PLy.tbvJKO').each do |element|
    begin
      # Отримання тексту з тегу <span>
      data1 = element.css('span').text.strip

      # Перевірка, чи елемент зустрічався
      unless seen_elements[data1]
        # Зберігання даних та ID у CSV-файл
        csv << [data1, id += 1]

        # Додавання елемента до хешу
        seen_elements[data1] = true
      end
    rescue StandardError => e
      # Обробка можливих помилок і виведення повідомлення
      puts "Помилка при обробці елемента: #{e.message}"
    end
  end
end

# Виведення повідомлення про успішне завершення роботи
puts "Дані були успішно збережені у файлі #{csv_filename}"
