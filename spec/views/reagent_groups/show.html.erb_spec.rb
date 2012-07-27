require 'spec_helper'

describe "reagent_groups/show" do
  before(:each) do
    @reagent_group = assign(:reagent_group, stub_model(ReagentGroup,
      :string => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
