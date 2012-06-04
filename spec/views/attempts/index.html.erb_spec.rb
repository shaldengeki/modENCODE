require 'spec_helper'

describe "attempts/index" do
  before(:each) do
    assign(:attempts, [
      stub_model(Attempt,
        :pipeline => nil,
        :status => nil,
        :reagent => nil
      ),
      stub_model(Attempt,
        :pipeline => nil,
        :status => nil,
        :reagent => nil
      )
    ])
  end

  it "renders a list of attempts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
