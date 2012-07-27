require 'spec_helper'

describe "reagent_groups/new" do
  before(:each) do
    assign(:reagent_group, stub_model(ReagentGroup,
      :string => ""
    ).as_new_record)
  end

  it "renders new reagent_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reagent_groups_path, :method => "post" do
      assert_select "input#reagent_group_string", :name => "reagent_group[string]"
    end
  end
end
