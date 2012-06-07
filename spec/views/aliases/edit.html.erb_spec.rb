require 'spec_helper'

describe "aliases/edit" do
  before(:each) do
    @alias = assign(:alias, stub_model(Alias,
      :name => "MyString",
      :transcription_factor => nil
    ))
  end

  it "renders the edit alias form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aliases_path(@alias), :method => "post" do
      assert_select "input#alias_name", :name => "alias[name]"
      assert_select "input#alias_transcription_factor", :name => "alias[transcription_factor]"
    end
  end
end
