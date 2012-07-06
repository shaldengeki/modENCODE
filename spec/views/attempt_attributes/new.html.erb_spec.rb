require 'spec_helper'

describe "attempt_attributes/new" do
  before(:each) do
    assign(:attempt_attribute, stub_model(AttemptAttribute,
      :name => "MyString",
      :reagent => nil
    ).as_new_record)
  end

  it "renders new attempt_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attempt_attributes_path, :method => "post" do
      assert_select "input#attempt_attribute_name", :name => "attempt_attribute[name]"
      assert_select "input#attempt_attribute_reagent", :name => "attempt_attribute[reagent]"
    end
  end
end
