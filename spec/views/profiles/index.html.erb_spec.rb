require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        user: nil,
        name: "Name",
        surname: "Surname",
        fatherly: "Fatherly",
        telephone: "Telephone"
      ),
      Profile.create!(
        user: nil,
        name: "Name",
        surname: "Surname",
        fatherly: "Fatherly",
        telephone: "Telephone"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Surname".to_s, count: 2
    assert_select "tr>td", text: "Fatherly".to_s, count: 2
    assert_select "tr>td", text: "Telephone".to_s, count: 2
  end
end
