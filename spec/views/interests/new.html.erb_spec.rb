require 'rails_helper'

RSpec.describe "interests/new", type: :view do
  before(:each) do
    assign(:interest, Interest.new(
      user: nil,
      service: nil
    ))
  end

  it "renders new interest form" do
    render

    assert_select "form[action=?][method=?]", interests_path, "post" do

      assert_select "input[name=?]", "interest[user_id]"

      assert_select "input[name=?]", "interest[service_id]"
    end
  end
end
