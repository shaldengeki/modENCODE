require 'spec_helper'

describe "pipelines/show" do
  before(:each) do
    @pipeline = assign(:pipeline, stub_model(Pipeline,
      :name => "Name",
      :description => "Description",
      :source => nil,
      :reagent_type => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
