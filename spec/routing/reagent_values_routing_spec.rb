require "spec_helper"

describe ReagentValuesController do
  describe "routing" do

    it "routes to #index" do
      get("/reagent_values").should route_to("reagent_values#index")
    end

    it "routes to #new" do
      get("/reagent_values/new").should route_to("reagent_values#new")
    end

    it "routes to #show" do
      get("/reagent_values/1").should route_to("reagent_values#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reagent_values/1/edit").should route_to("reagent_values#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reagent_values").should route_to("reagent_values#create")
    end

    it "routes to #update" do
      put("/reagent_values/1").should route_to("reagent_values#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reagent_values/1").should route_to("reagent_values#destroy", :id => "1")
    end

  end
end
