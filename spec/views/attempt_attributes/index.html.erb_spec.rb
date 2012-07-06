require 'spec_helper'

describe "attempt_attributes/index" do
  before(:each) do
    assign(:attempt_attributes, [
      stub_model(AttemptAttribute,
        :name => "Name",
        :reagent => nil
      ),
      stub_model(AttemptAttribute,
        :name => "Name",
        :reagent => nil
      )
    ])
  end

  it "renders a list of attempt_attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
