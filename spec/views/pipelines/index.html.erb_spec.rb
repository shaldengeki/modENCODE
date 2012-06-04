require 'spec_helper'

describe "pipelines/index" do
  before(:each) do
    assign(:pipelines, [
      stub_model(Pipeline,
        :name => "Name",
        :description => "Description",
        :source => nil,
        :reagent_type => nil
      ),
      stub_model(Pipeline,
        :name => "Name",
        :description => "Description",
        :source => nil,
        :reagent_type => nil
      )
    ])
  end

  it "renders a list of pipelines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
