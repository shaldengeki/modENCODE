require "spec_helper"

describe GeneTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/gene_types").should route_to("gene_types#index")
    end

    it "routes to #new" do
      get("/gene_types/new").should route_to("gene_types#new")
    end

    it "routes to #show" do
      get("/gene_types/1").should route_to("gene_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gene_types/1/edit").should route_to("gene_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gene_types").should route_to("gene_types#create")
    end

    it "routes to #update" do
      put("/gene_types/1").should route_to("gene_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gene_types/1").should route_to("gene_types#destroy", :id => "1")
    end

  end
end
