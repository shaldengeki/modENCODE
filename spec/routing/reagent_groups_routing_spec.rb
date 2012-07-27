require "spec_helper"

describe ReagentGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/reagent_groups").should route_to("reagent_groups#index")
    end

    it "routes to #new" do
      get("/reagent_groups/new").should route_to("reagent_groups#new")
    end

    it "routes to #show" do
      get("/reagent_groups/1").should route_to("reagent_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reagent_groups/1/edit").should route_to("reagent_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reagent_groups").should route_to("reagent_groups#create")
    end

    it "routes to #update" do
      put("/reagent_groups/1").should route_to("reagent_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reagent_groups/1").should route_to("reagent_groups#destroy", :id => "1")
    end

  end
end
