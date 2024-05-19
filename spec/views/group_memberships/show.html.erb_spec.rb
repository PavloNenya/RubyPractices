require 'rails_helper'

RSpec.describe "group_memberships/show", type: :view do
  before(:each) do
    @group_membership = assign(:group_membership, GroupMembership.create!(
      group: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
