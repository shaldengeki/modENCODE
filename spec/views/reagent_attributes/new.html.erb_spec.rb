require 'spec_helper'

describe "reagent_attributes/new" do
  before(:each) do
    assign(:reagent_attribute, stub_model(ReagentAttribute,
      :name => "MyString",
      :reagent_type => nil
    ).as_new_record)
  end

  it "renders new reagent_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reagent_attributes_path, :method => "post" do
      assert_select "input#reagent_attribute_name", :name => "reagent_attribute[name]"
      assert_select "input#reagent_attribute_reagent_type", :name => "reagent_attribute[reagent_type]"
    end
  end
end
