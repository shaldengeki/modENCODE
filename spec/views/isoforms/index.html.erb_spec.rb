require 'spec_helper'

describe "isoforms/index" do
  before(:each) do
    assign(:isoforms, [
      stub_model(Isoform,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Isoform,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of isoforms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
