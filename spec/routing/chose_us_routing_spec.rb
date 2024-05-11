require "rails_helper"

RSpec.describe ChoseUsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/chose_us").to route_to("chose_us#index")
    end

    it "routes to #new" do
      expect(get: "/chose_us/new").to route_to("chose_us#new")
    end

    it "routes to #show" do
      expect(get: "/chose_us/1").to route_to("chose_us#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/chose_us/1/edit").to route_to("chose_us#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/chose_us").to route_to("chose_us#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/chose_us/1").to route_to("chose_us#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/chose_us/1").to route_to("chose_us#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/chose_us/1").to route_to("chose_us#destroy", id: "1")
    end
  end
end
