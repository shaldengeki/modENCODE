require "spec_helper"

describe TranscriptionFactorsController do
  describe "routing" do

    it "routes to #index" do
      get("/transcription_factors").should route_to("transcription_factors#index")
    end

    it "routes to #new" do
      get("/transcription_factors/new").should route_to("transcription_factors#new")
    end

    it "routes to #show" do
      get("/transcription_factors/1").should route_to("transcription_factors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transcription_factors/1/edit").should route_to("transcription_factors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transcription_factors").should route_to("transcription_factors#create")
    end

    it "routes to #update" do
      put("/transcription_factors/1").should route_to("transcription_factors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transcription_factors/1").should route_to("transcription_factors#destroy", :id => "1")
    end

  end
end
