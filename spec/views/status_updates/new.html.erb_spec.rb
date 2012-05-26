require 'spec_helper'

describe "status_updates/new" do
  before(:each) do
    assign(:status_update, stub_model(StatusUpdate,
      :user => nil,
      :status => nil,
      :reagent => nil,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new status_update form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => status_updates_path, :method => "post" do
      assert_select "input#status_update_user", :name => "status_update[user]"
      assert_select "input#status_update_status", :name => "status_update[status]"
      assert_select "input#status_update_reagent", :name => "status_update[reagent]"
      assert_select "input#status_update_description", :name => "status_update[description]"
    end
  end
end
