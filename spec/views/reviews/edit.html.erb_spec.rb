require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      poster: nil,
      user: nil,
      rating: 1,
      comment: "MyText"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input[name=?]", "review[poster_id]"

      assert_select "input[name=?]", "review[user_id]"

      assert_select "input[name=?]", "review[rating]"

      assert_select "textarea[name=?]", "review[comment]"
    end
  end
end
