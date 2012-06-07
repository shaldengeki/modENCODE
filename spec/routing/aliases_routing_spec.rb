require "spec_helper"

describe AliasesController do
  describe "routing" do

    it "routes to #index" do
      get("/aliases").should route_to("aliases#index")
    end

    it "routes to #new" do
      get("/aliases/new").should route_to("aliases#new")
    end

    it "routes to #show" do
      get("/aliases/1").should route_to("aliases#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aliases/1/edit").should route_to("aliases#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aliases").should route_to("aliases#create")
    end

    it "routes to #update" do
      put("/aliases/1").should route_to("aliases#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aliases/1").should route_to("aliases#destroy", :id => "1")
    end

  end
end
