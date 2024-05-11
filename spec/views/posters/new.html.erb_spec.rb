require 'rails_helper'

RSpec.describe "posters/new", type: :view do
  before(:each) do
    assign(:poster, Poster.new(
      name: "MyString",
      user: nil,
      service: nil,
      price: "9.99",
      description: "MyText"
    ))
  end

  it "renders new poster form" do
    render

    assert_select "form[action=?][method=?]", posters_path, "post" do

      assert_select "input[name=?]", "poster[name]"

      assert_select "input[name=?]", "poster[user_id]"

      assert_select "input[name=?]", "poster[service_id]"

      assert_select "input[name=?]", "poster[price]"

      assert_select "textarea[name=?]", "poster[description]"
    end
  end
end
