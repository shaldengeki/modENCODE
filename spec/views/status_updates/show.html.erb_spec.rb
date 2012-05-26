require 'spec_helper'

describe "status_updates/show" do
  before(:each) do
    @status_update = assign(:status_update, stub_model(StatusUpdate,
      :user => nil,
      :status => nil,
      :reagent => nil,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Description/)
  end
end
