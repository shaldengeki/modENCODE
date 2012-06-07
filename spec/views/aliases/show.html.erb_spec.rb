require 'spec_helper'

describe "aliases/show" do
  before(:each) do
    @alias = assign(:alias, stub_model(Alias,
      :name => "Name",
      :transcription_factor => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
