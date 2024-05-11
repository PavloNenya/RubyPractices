require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      user: nil,
      name: "MyString",
      surname: "MyString",
      fatherly: "MyString",
      telephone: "MyString"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[name]"

      assert_select "input[name=?]", "profile[surname]"

      assert_select "input[name=?]", "profile[fatherly]"

      assert_select "input[name=?]", "profile[telephone]"
    end
  end
end
