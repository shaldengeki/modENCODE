require "spec_helper"

describe AttemptValuesController do
  describe "routing" do

    it "routes to #index" do
      get("/attempt_values").should route_to("attempt_values#index")
    end

    it "routes to #new" do
      get("/attempt_values/new").should route_to("attempt_values#new")
    end

    it "routes to #show" do
      get("/attempt_values/1").should route_to("attempt_values#show", :id => "1")
    end

    it "routes to #edit" do
      get("/attempt_values/1/edit").should route_to("attempt_values#edit", :id => "1")
    end

    it "routes to #create" do
      post("/attempt_values").should route_to("attempt_values#create")
    end

    it "routes to #update" do
      put("/attempt_values/1").should route_to("attempt_values#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/attempt_values/1").should route_to("attempt_values#destroy", :id => "1")
    end

  end
end
