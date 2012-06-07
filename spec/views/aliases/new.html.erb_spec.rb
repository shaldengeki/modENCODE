require 'spec_helper'

describe "aliases/new" do
  before(:each) do
    assign(:alias, stub_model(Alias,
      :name => "MyString",
      :transcription_factor => nil
    ).as_new_record)
  end

  it "renders new alias form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aliases_path, :method => "post" do
      assert_select "input#alias_name", :name => "alias[name]"
      assert_select "input#alias_transcription_factor", :name => "alias[transcription_factor]"
    end
  end
end
