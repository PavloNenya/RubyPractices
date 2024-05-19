require 'rails_helper'

RSpec.describe "group_memberships/new", type: :view do
  before(:each) do
    assign(:group_membership, GroupMembership.new(
      group: nil,
      user: nil
    ))
  end

  it "renders new group_membership form" do
    render

    assert_select "form[action=?][method=?]", group_memberships_path, "post" do

      assert_select "input[name=?]", "group_membership[group_id]"

      assert_select "input[name=?]", "group_membership[user_id]"
    end
  end
end
