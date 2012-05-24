require 'spec_helper'

describe "reagent_types/show" do
  before(:each) do
    @reagent_type = assign(:reagent_type, stub_model(ReagentType,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
