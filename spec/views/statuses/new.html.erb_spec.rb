require 'spec_helper'

describe "statuses/new" do
  before(:each) do
    assign(:status, stub_model(Status,
      :name => "MyString",
      :reagent => nil,
      :start => false,
      :end => false,
      :position => 1
    ).as_new_record)
  end

  it "renders new status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statuses_path, :method => "post" do
      assert_select "input#status_name", :name => "status[name]"
      assert_select "input#status_reagent", :name => "status[reagent]"
      assert_select "input#status_start", :name => "status[start]"
      assert_select "input#status_end", :name => "status[end]"
      assert_select "input#status_position", :name => "status[position]"
    end
  end
end
