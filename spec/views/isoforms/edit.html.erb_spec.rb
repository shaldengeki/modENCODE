require 'spec_helper'

describe "isoforms/edit" do
  before(:each) do
    @isoform = assign(:isoform, stub_model(Isoform,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit isoform form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => isoforms_path(@isoform), :method => "post" do
      assert_select "input#isoform_name", :name => "isoform[name]"
      assert_select "input#isoform_description", :name => "isoform[description]"
    end
  end
end
