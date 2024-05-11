require 'rails_helper'

RSpec.describe "posters/show", type: :view do
  before(:each) do
    @poster = assign(:poster, Poster.create!(
      name: "Name",
      user: nil,
      service: nil,
      price: "9.99",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
  end
end
