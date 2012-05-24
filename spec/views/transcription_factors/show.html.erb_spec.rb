require 'spec_helper'

describe "transcription_factors/show" do
  before(:each) do
    @transcription_factor = assign(:transcription_factor, stub_model(TranscriptionFactor,
      :name => "Name",
      :flybase_id => "Flybase",
      :cg_id => "Cg",
      :refseq_id => "Refseq"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Flybase/)
    rendered.should match(/Cg/)
    rendered.should match(/Refseq/)
  end
end
