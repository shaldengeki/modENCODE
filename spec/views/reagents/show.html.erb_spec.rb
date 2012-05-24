require 'spec_helper'

describe "reagents/show" do
  before(:each) do
    @reagent = assign(:reagent, stub_model(Reagent,
      :name => "Name",
      :description => "Description",
      :transcription_factor => nil,
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
    rendered.should match(//)
  end
end
