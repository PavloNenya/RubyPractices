require 'rails_helper'

RSpec.describe "posters/edit", type: :view do
  before(:each) do
    @poster = assign(:poster, Poster.create!(
      name: "MyString",
      user: nil,
      service: nil,
      price: "9.99",
      description: "MyText"
    ))
  end

  it "renders the edit poster form" do
    render

    assert_select "form[action=?][method=?]", poster_path(@poster), "post" do

      assert_select "input[name=?]", "poster[name]"

      assert_select "input[name=?]", "poster[user_id]"

      assert_select "input[name=?]", "poster[service_id]"

      assert_select "input[name=?]", "poster[price]"

      assert_select "textarea[name=?]", "poster[description]"
    end
  end
end
