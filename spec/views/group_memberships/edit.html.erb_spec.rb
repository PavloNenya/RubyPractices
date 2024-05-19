require 'rails_helper'

RSpec.describe "group_memberships/edit", type: :view do
  before(:each) do
    @group_membership = assign(:group_membership, GroupMembership.create!(
      group: nil,
      user: nil
    ))
  end

  it "renders the edit group_membership form" do
    render

    assert_select "form[action=?][method=?]", group_membership_path(@group_membership), "post" do

      assert_select "input[name=?]", "group_membership[group_id]"

      assert_select "input[name=?]", "group_membership[user_id]"
    end
  end
end
