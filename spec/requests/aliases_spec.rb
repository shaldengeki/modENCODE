require 'spec_helper'

describe "Aliases" do
  describe "GET /aliases" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get aliases_path
      response.status.should be(200)
    end
  end
end
