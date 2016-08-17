require "rails_helper"

RSpec.describe UnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/units").to route_to("units#index")
    end

    it "routes to #new" do
      expect(get: "/units/new").to route_to("units#new")
    end

    it "routes to #show" do
      expect(get: "/units/1").to route_to("units#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/units/1/edit").to route_to("units#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/units").to route_to("units#create")
    end

    it "routes to #update via PUT and PATCH" do
      expect(put: "/units/1").to route_to("units#update", id: "1")
      expect(patch: "/units/1").to route_to("units#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/units/1").to route_to("units#destroy", id: "1")
    end

    context "for nested memberships" do
      it "routes to #create" do
        expect(post: "/units/2/memberships").to route_to("memberships#create", unit_id: "2")
      end

      it "routes to #update via PUT and PATCH" do
        expect(put: "/units/2/memberships/1").to route_to("memberships#update", unit_id: "2", id: "1")
        expect(patch: "/units/2/memberships/1").to route_to("memberships#update", unit_id: "2", id: "1")
      end

      it "routes to #destroy" do
        expect(delete: "/units/2/memberships/1").to route_to("memberships#destroy", unit_id: "2", id: "1")
      end

      it "does not route to #new, #edit, #index or #show" do
        expect(get: "/units/2/memberships/new").not_to be_routable
        expect(get: "/units/2/memberships/1/edit").not_to be_routable
        expect(get: "/units/2/memberships").not_to be_routable
        expect(get: "/units/2/memberships/1").not_to be_routable
      end
    end
  end
end
