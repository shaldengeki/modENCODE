require "spec_helper"

describe AttemptAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/attempt_attributes").should route_to("attempt_attributes#index")
    end

    it "routes to #new" do
      get("/attempt_attributes/new").should route_to("attempt_attributes#new")
    end

    it "routes to #show" do
      get("/attempt_attributes/1").should route_to("attempt_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/attempt_attributes/1/edit").should route_to("attempt_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/attempt_attributes").should route_to("attempt_attributes#create")
    end

    it "routes to #update" do
      put("/attempt_attributes/1").should route_to("attempt_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/attempt_attributes/1").should route_to("attempt_attributes#destroy", :id => "1")
    end

  end
end
