require "spec_helper"

describe IsoformsController do
  describe "routing" do

    it "routes to #index" do
      get("/isoforms").should route_to("isoforms#index")
    end

    it "routes to #new" do
      get("/isoforms/new").should route_to("isoforms#new")
    end

    it "routes to #show" do
      get("/isoforms/1").should route_to("isoforms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/isoforms/1/edit").should route_to("isoforms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/isoforms").should route_to("isoforms#create")
    end

    it "routes to #update" do
      put("/isoforms/1").should route_to("isoforms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/isoforms/1").should route_to("isoforms#destroy", :id => "1")
    end

  end
end
