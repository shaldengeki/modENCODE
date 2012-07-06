require 'spec_helper'

describe "attempt_values/edit" do
  before(:each) do
    @attempt_value = assign(:attempt_value, stub_model(AttemptValue,
      :value => "MyString",
      :attempt => nil,
      :attempt_attribute => nil
    ))
  end

  it "renders the edit attempt_value form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attempt_values_path(@attempt_value), :method => "post" do
      assert_select "input#attempt_value_value", :name => "attempt_value[value]"
      assert_select "input#attempt_value_attempt", :name => "attempt_value[attempt]"
      assert_select "input#attempt_value_attempt_attribute", :name => "attempt_value[attempt_attribute]"
    end
  end
end
