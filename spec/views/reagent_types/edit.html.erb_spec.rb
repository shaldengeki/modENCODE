require 'spec_helper'

describe "reagent_types/edit" do
  before(:each) do
    @reagent_type = assign(:reagent_type, stub_model(ReagentType,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit reagent_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reagent_types_path(@reagent_type), :method => "post" do
      assert_select "input#reagent_type_name", :name => "reagent_type[name]"
      assert_select "input#reagent_type_description", :name => "reagent_type[description]"
    end
  end
end
