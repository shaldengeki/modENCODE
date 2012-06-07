require 'spec_helper'

describe "aliases/index" do
  before(:each) do
    assign(:aliases, [
      stub_model(Alias,
        :name => "Name",
        :transcription_factor => nil
      ),
      stub_model(Alias,
        :name => "Name",
        :transcription_factor => nil
      )
    ])
  end

  it "renders a list of aliases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
