require 'spec_helper'

describe "reagent_attributes/show" do
  before(:each) do
    @reagent_attribute = assign(:reagent_attribute, stub_model(ReagentAttribute,
      :name => "Name",
      :reagent_type => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
