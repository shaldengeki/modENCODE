require 'spec_helper'

describe "isoforms/new" do
  before(:each) do
    assign(:isoform, stub_model(Isoform,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new isoform form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => isoforms_path, :method => "post" do
      assert_select "input#isoform_name", :name => "isoform[name]"
      assert_select "input#isoform_description", :name => "isoform[description]"
    end
  end
end
