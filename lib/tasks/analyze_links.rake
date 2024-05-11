# lib/tasks/analyze_links.rake

require 'rake'
require 'active_record'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'mechanize'

namespace :analyze do
  desc "Parse website links and store in database"
  task :links => :environment do
    # URL of the site that will be parsed
    url = 'https://www.nerdwallet.com/article/small-business/service-business-ideas'

    # Initialize the Mechanize object to interact with the web page
    agent = Mechanize.new
    page = agent.get(url)
    doc = Nokogiri::HTML(page.body)

    # Loop through elements and create business models
    start_index = 15 # 16th element (starts at 0)
    doc.css('div._3VJt4n ol._2vAAlI li._134slX._2C6PLy.tbvJKO').each_with_index do |element, index|
      begin
        # Getting the text from the <span> tag
        data1 = element.css('span').text.strip

        # Create or update BusinessModel object
        BusinessModel.create(name: data1, index: start_index + index + 1)
      rescue StandardError => e
        # Handling possible errors and displaying a message
        puts "Error processing element: #{e.message}"
      end
    end

    # Display a message about the successful completion of work
    puts "Data was successfully saved to database"
  end
end