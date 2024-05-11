require "rails_helper"

RSpec.describe ChosePsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/chose_ps").to route_to("chose_ps#index")
    end

    it "routes to #new" do
      expect(get: "/chose_ps/new").to route_to("chose_ps#new")
    end

    it "routes to #show" do
      expect(get: "/chose_ps/1").to route_to("chose_ps#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/chose_ps/1/edit").to route_to("chose_ps#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/chose_ps").to route_to("chose_ps#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/chose_ps/1").to route_to("chose_ps#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/chose_ps/1").to route_to("chose_ps#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/chose_ps/1").to route_to("chose_ps#destroy", id: "1")
    end
  end
end
