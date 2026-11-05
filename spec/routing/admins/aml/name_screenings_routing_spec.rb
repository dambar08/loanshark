require "rails_helper"

RSpec.describe Admins::Aml::NameScreeningsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admins/aml/name_screenings").to route_to("admins/aml/name_screenings#index")
    end

    it "routes to #new" do
      expect(get: "/admins/aml/name_screenings/new").to route_to("admins/aml/name_screenings#new")
    end

    it "routes to #show" do
      expect(get: "/admins/aml/name_screenings/1").to route_to("admins/aml/name_screenings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admins/aml/name_screenings/1/edit").to route_to("admins/aml/name_screenings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admins/aml/name_screenings").to route_to("admins/aml/name_screenings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admins/aml/name_screenings/1").to route_to("admins/aml/name_screenings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admins/aml/name_screenings/1").to route_to("admins/aml/name_screenings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admins/aml/name_screenings/1").to route_to("admins/aml/name_screenings#destroy", id: "1")
    end
  end
end
