require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      user: nil,
      name: "MyString",
      surname: "MyString",
      fatherly: "MyString",
      telephone: "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[name]"

      assert_select "input[name=?]", "profile[surname]"

      assert_select "input[name=?]", "profile[fatherly]"

      assert_select "input[name=?]", "profile[telephone]"
    end
  end
end
