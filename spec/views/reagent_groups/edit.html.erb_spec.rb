require 'spec_helper'

describe "reagent_groups/edit" do
  before(:each) do
    @reagent_group = assign(:reagent_group, stub_model(ReagentGroup,
      :string => ""
    ))
  end

  it "renders the edit reagent_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reagent_groups_path(@reagent_group), :method => "post" do
      assert_select "input#reagent_group_string", :name => "reagent_group[string]"
    end
  end
end
