require 'spec_helper'

describe "reagents/index" do
  before(:each) do
    assign(:reagents, [
      stub_model(Reagent,
        :name => "Name",
        :description => "Description",
        :transcription_factor => nil,
        :source => nil,
        :reagent_type => nil
      ),
      stub_model(Reagent,
        :name => "Name",
        :description => "Description",
        :transcription_factor => nil,
        :source => nil,
        :reagent_type => nil
      )
    ])
  end

  it "renders a list of reagents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
