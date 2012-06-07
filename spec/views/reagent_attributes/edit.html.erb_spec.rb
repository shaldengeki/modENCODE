require 'spec_helper'

describe "reagent_attributes/edit" do
  before(:each) do
    @reagent_attribute = assign(:reagent_attribute, stub_model(ReagentAttribute,
      :name => "MyString",
      :reagent_type => nil
    ))
  end

  it "renders the edit reagent_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reagent_attributes_path(@reagent_attribute), :method => "post" do
      assert_select "input#reagent_attribute_name", :name => "reagent_attribute[name]"
      assert_select "input#reagent_attribute_reagent_type", :name => "reagent_attribute[reagent_type]"
    end
  end
end
