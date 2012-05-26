require 'spec_helper'

describe "statuses/show" do
  before(:each) do
    @status = assign(:status, stub_model(Status,
      :name => "Name",
      :reagent => nil,
      :start => false,
      :end => false,
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
