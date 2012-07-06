require 'spec_helper'

describe "attempt_attributes/show" do
  before(:each) do
    @attempt_attribute = assign(:attempt_attribute, stub_model(AttemptAttribute,
      :name => "Name",
      :reagent => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
