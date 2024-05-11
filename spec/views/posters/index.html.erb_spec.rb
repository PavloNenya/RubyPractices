require 'rails_helper'

RSpec.describe "posters/index", type: :view do
  before(:each) do
    assign(:posters, [
      Poster.create!(
        name: "Name",
        user: nil,
        service: nil,
        price: "9.99",
        description: "MyText"
      ),
      Poster.create!(
        name: "Name",
        user: nil,
        service: nil,
        price: "9.99",
        description: "MyText"
      )
    ])
  end

  it "renders a list of posters" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
