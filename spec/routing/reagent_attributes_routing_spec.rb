require "spec_helper"

describe ReagentAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/reagent_attributes").should route_to("reagent_attributes#index")
    end

    it "routes to #new" do
      get("/reagent_attributes/new").should route_to("reagent_attributes#new")
    end

    it "routes to #show" do
      get("/reagent_attributes/1").should route_to("reagent_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reagent_attributes/1/edit").should route_to("reagent_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reagent_attributes").should route_to("reagent_attributes#create")
    end

    it "routes to #update" do
      put("/reagent_attributes/1").should route_to("reagent_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reagent_attributes/1").should route_to("reagent_attributes#destroy", :id => "1")
    end

  end
end
