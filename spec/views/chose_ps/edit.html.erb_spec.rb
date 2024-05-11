require 'rails_helper'

RSpec.describe "chose_ps/edit", type: :view do
  before(:each) do
    @chose_p = assign(:chose_p, ChoseP.create!(
      service: nil,
      user: nil,
      choice: "MyString"
    ))
  end

  it "renders the edit chose_p form" do
    render

    assert_select "form[action=?][method=?]", chose_p_path(@chose_p), "post" do

      assert_select "input[name=?]", "chose_p[service_id]"

      assert_select "input[name=?]", "chose_p[user_id]"

      assert_select "input[name=?]", "chose_p[choice]"
    end
  end
end
