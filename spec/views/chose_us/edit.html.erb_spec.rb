require 'rails_helper'

RSpec.describe "chose_us/edit", type: :view do
  before(:each) do
    @chose_u = assign(:chose_u, ChoseU.create!(
      service: nil,
      user: nil,
      choice: "MyString"
    ))
  end

  it "renders the edit chose_u form" do
    render

    assert_select "form[action=?][method=?]", chose_u_path(@chose_u), "post" do

      assert_select "input[name=?]", "chose_u[service_id]"

      assert_select "input[name=?]", "chose_u[user_id]"

      assert_select "input[name=?]", "chose_u[choice]"
    end
  end
end
