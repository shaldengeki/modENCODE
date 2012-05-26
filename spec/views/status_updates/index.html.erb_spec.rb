require 'spec_helper'

describe "status_updates/index" do
  before(:each) do
    assign(:status_updates, [
      stub_model(StatusUpdate,
        :user => nil,
        :status => nil,
        :reagent => nil,
        :description => "Description"
      ),
      stub_model(StatusUpdate,
        :user => nil,
        :status => nil,
        :reagent => nil,
        :description => "Description"
      )
    ])
  end

  it "renders a list of status_updates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
