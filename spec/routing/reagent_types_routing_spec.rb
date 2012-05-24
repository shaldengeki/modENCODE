require "spec_helper"

describe ReagentTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/reagent_types").should route_to("reagent_types#index")
    end

    it "routes to #new" do
      get("/reagent_types/new").should route_to("reagent_types#new")
    end

    it "routes to #show" do
      get("/reagent_types/1").should route_to("reagent_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reagent_types/1/edit").should route_to("reagent_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reagent_types").should route_to("reagent_types#create")
    end

    it "routes to #update" do
      put("/reagent_types/1").should route_to("reagent_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reagent_types/1").should route_to("reagent_types#destroy", :id => "1")
    end

  end
end
