require 'rails_helper'

RSpec.describe "chose_us/index", type: :view do
  before(:each) do
    assign(:chose_us, [
      ChoseU.create!(
        service: nil,
        user: nil,
        choice: "Choice"
      ),
      ChoseU.create!(
        service: nil,
        user: nil,
        choice: "Choice"
      )
    ])
  end

  it "renders a list of chose_us" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Choice".to_s, count: 2
  end
end
