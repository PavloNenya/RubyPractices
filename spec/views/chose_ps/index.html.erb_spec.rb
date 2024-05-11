require 'rails_helper'

RSpec.describe "chose_ps/index", type: :view do
  before(:each) do
    assign(:chose_ps, [
      ChoseP.create!(
        service: nil,
        user: nil,
        choice: "Choice"
      ),
      ChoseP.create!(
        service: nil,
        user: nil,
        choice: "Choice"
      )
    ])
  end

  it "renders a list of chose_ps" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Choice".to_s, count: 2
  end
end
