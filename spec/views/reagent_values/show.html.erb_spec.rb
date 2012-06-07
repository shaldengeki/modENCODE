require 'spec_helper'

describe "reagent_values/show" do
  before(:each) do
    @reagent_value = assign(:reagent_value, stub_model(ReagentValue,
      :value => "Value",
      :reagent_attribute => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    rendered.should match(//)
  end
end
