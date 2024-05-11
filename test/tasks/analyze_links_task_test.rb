# test/tasks/analyze_links_task_test.rb

require 'test_helper'
require 'rake'

class AnalyzeLinksTaskTest < ActiveSupport::TestCase
  def setup
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require "tasks/analyze_links"
    Rake::Task.define_task(:environment)
  end

  test "should parse website and store in database" do
    VCR.use_cassette('nerdwallet_article') do
      assert_difference 'BusinessModel.count', 5 do
        @rake['analyze:links'].invoke
      end
    end
  end
end
