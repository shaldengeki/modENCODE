require 'spec_helper'

describe "reagent_values/index" do
  before(:each) do
    assign(:reagent_values, [
      stub_model(ReagentValue,
        :value => "Value",
        :reagent_attribute => nil
      ),
      stub_model(ReagentValue,
        :value => "Value",
        :reagent_attribute => nil
      )
    ])
  end

  it "renders a list of reagent_values" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
