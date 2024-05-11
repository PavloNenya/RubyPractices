require 'rails_helper'

RSpec.describe "chose_ps/new", type: :view do
  before(:each) do
    assign(:chose_p, ChoseP.new(
      service: nil,
      user: nil,
      choice: "MyString"
    ))
  end

  it "renders new chose_p form" do
    render

    assert_select "form[action=?][method=?]", chose_ps_path, "post" do

      assert_select "input[name=?]", "chose_p[service_id]"

      assert_select "input[name=?]", "chose_p[user_id]"

      assert_select "input[name=?]", "chose_p[choice]"
    end
  end
end
