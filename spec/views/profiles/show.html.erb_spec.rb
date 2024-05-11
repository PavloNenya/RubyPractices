require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      user: nil,
      name: "Name",
      surname: "Surname",
      fatherly: "Fatherly",
      telephone: "Telephone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Fatherly/)
    expect(rendered).to match(/Telephone/)
  end
end
