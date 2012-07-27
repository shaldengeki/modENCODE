require 'spec_helper'

describe "reagent_groups/index" do
  before(:each) do
    assign(:reagent_groups, [
      stub_model(ReagentGroup,
        :string => ""
      ),
      stub_model(ReagentGroup,
        :string => ""
      )
    ])
  end

  it "renders a list of reagent_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
