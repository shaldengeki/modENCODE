require 'spec_helper'

describe "attempt_values/index" do
  before(:each) do
    assign(:attempt_values, [
      stub_model(AttemptValue,
        :value => "Value",
        :attempt => nil,
        :attempt_attribute => nil
      ),
      stub_model(AttemptValue,
        :value => "Value",
        :attempt => nil,
        :attempt_attribute => nil
      )
    ])
  end

  it "renders a list of attempt_values" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
