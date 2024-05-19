require 'rails_helper'

RSpec.describe "group_memberships/index", type: :view do
  before(:each) do
    assign(:group_memberships, [
      GroupMembership.create!(
        group: nil,
        user: nil
      ),
      GroupMembership.create!(
        group: nil,
        user: nil
      )
    ])
  end

  it "renders a list of group_memberships" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
