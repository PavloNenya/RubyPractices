require 'rails_helper'

RSpec.describe "chose_us/new", type: :view do
  before(:each) do
    assign(:chose_u, ChoseU.new(
      service: nil,
      user: nil,
      choice: "MyString"
    ))
  end

  it "renders new chose_u form" do
    render

    assert_select "form[action=?][method=?]", chose_us_path, "post" do

      assert_select "input[name=?]", "chose_u[service_id]"

      assert_select "input[name=?]", "chose_u[user_id]"

      assert_select "input[name=?]", "chose_u[choice]"
    end
  end
end
