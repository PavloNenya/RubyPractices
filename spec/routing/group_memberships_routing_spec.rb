require "rails_helper"

RSpec.describe GroupMembershipsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/group_memberships").to route_to("group_memberships#index")
    end

    it "routes to #new" do
      expect(get: "/group_memberships/new").to route_to("group_memberships#new")
    end

    it "routes to #show" do
      expect(get: "/group_memberships/1").to route_to("group_memberships#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/group_memberships/1/edit").to route_to("group_memberships#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/group_memberships").to route_to("group_memberships#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/group_memberships/1").to route_to("group_memberships#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/group_memberships/1").to route_to("group_memberships#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/group_memberships/1").to route_to("group_memberships#destroy", id: "1")
    end
  end
end
