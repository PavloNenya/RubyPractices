require 'test_helper'
require 'rake'

class ParseLinksTaskTest < ActiveSupport::TestCase
  def setup
    @rake = Rake::Application.new
    Rake.application = @rake
    Rails.application.load_tasks
  end

  test "parse:links task should parse and save links" do

    stub_request(:get, "https://www.nerdwallet.com/article/small-business/service-business-ideas")
      .to_return(body: File.read('test/fixtures/example.html'))

    out, _ = capture_io do
      Rake::Task["parse:links"].invoke
    end

    assert_match(/Знайдено посилання:/, out)

  end
end
