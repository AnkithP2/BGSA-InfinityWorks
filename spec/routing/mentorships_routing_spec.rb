require "rails_helper"

RSpec.describe MentorshipsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mentorships").to route_to("mentorships#index")
    end

    it "routes to #new" do
      expect(get: "/mentorships/new").to route_to("mentorships#new")
    end

    it "routes to #show" do
      expect(get: "/mentorships/1").to route_to("mentorships#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/mentorships/1/edit").to route_to("mentorships#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mentorships").to route_to("mentorships#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mentorships/1").to route_to("mentorships#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mentorships/1").to route_to("mentorships#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mentorships/1").to route_to("mentorships#destroy", id: "1")
    end
  end
end
