require 'rails_helper'

RSpec.describe "chose_us/show", type: :view do
  before(:each) do
    @chose_u = assign(:chose_u, ChoseU.create!(
      service: nil,
      user: nil,
      choice: "Choice"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Choice/)
  end
end
