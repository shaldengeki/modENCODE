require 'spec_helper'

describe "reagent_values/edit" do
  before(:each) do
    @reagent_value = assign(:reagent_value, stub_model(ReagentValue,
      :value => "MyString",
      :reagent_attribute => nil
    ))
  end

  it "renders the edit reagent_value form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reagent_values_path(@reagent_value), :method => "post" do
      assert_select "input#reagent_value_value", :name => "reagent_value[value]"
      assert_select "input#reagent_value_reagent_attribute", :name => "reagent_value[reagent_attribute]"
    end
  end
end
