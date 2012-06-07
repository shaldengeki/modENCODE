require 'spec_helper'

describe "reagent_attributes/index" do
  before(:each) do
    assign(:reagent_attributes, [
      stub_model(ReagentAttribute,
        :name => "Name",
        :reagent_type => nil
      ),
      stub_model(ReagentAttribute,
        :name => "Name",
        :reagent_type => nil
      )
    ])
  end

  it "renders a list of reagent_attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
