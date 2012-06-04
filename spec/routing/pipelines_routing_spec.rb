require "spec_helper"

describe PipelinesController do
  describe "routing" do

    it "routes to #index" do
      get("/pipelines").should route_to("pipelines#index")
    end

    it "routes to #new" do
      get("/pipelines/new").should route_to("pipelines#new")
    end

    it "routes to #show" do
      get("/pipelines/1").should route_to("pipelines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pipelines/1/edit").should route_to("pipelines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pipelines").should route_to("pipelines#create")
    end

    it "routes to #update" do
      put("/pipelines/1").should route_to("pipelines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pipelines/1").should route_to("pipelines#destroy", :id => "1")
    end

  end
end
