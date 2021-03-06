require 'spec_helper'

describe "sources/new" do
  before(:each) do
    assign(:source, stub_model(Source,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new source form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sources_path, :method => "post" do
      assert_select "input#source_name", :name => "source[name]"
      assert_select "input#source_description", :name => "source[description]"
    end
  end
end
