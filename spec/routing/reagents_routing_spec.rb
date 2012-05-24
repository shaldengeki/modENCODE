require "spec_helper"

describe ReagentsController do
  describe "routing" do

    it "routes to #index" do
      get("/reagents").should route_to("reagents#index")
    end

    it "routes to #new" do
      get("/reagents/new").should route_to("reagents#new")
    end

    it "routes to #show" do
      get("/reagents/1").should route_to("reagents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reagents/1/edit").should route_to("reagents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reagents").should route_to("reagents#create")
    end

    it "routes to #update" do
      put("/reagents/1").should route_to("reagents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reagents/1").should route_to("reagents#destroy", :id => "1")
    end

  end
end
