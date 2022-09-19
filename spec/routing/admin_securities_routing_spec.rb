require "rails_helper"

RSpec.describe AdminSecuritiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin_securities").to route_to("admin_securities#index")
    end

    it "routes to #new" do
      expect(get: "/admin_securities/new").to route_to("admin_securities#new")
    end

    it "routes to #show" do
      expect(get: "/admin_securities/1").to route_to("admin_securities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin_securities/1/edit").to route_to("admin_securities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin_securities").to route_to("admin_securities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin_securities/1").to route_to("admin_securities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin_securities/1").to route_to("admin_securities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin_securities/1").to route_to("admin_securities#destroy", id: "1")
    end
  end
end
