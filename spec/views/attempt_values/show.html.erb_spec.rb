require 'spec_helper'

describe "attempt_values/show" do
  before(:each) do
    @attempt_value = assign(:attempt_value, stub_model(AttemptValue,
      :value => "Value",
      :attempt => nil,
      :attempt_attribute => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
