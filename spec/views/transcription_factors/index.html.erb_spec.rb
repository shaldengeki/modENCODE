require 'spec_helper'

describe "transcription_factors/index" do
  before(:each) do
    assign(:transcription_factors, [
      stub_model(TranscriptionFactor,
        :name => "Name",
        :flybase_id => "Flybase",
        :cg_id => "Cg",
        :refseq_id => "Refseq"
      ),
      stub_model(TranscriptionFactor,
        :name => "Name",
        :flybase_id => "Flybase",
        :cg_id => "Cg",
        :refseq_id => "Refseq"
      )
    ])
  end

  it "renders a list of transcription_factors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Flybase".to_s, :count => 2
    assert_select "tr>td", :text => "Cg".to_s, :count => 2
    assert_select "tr>td", :text => "Refseq".to_s, :count => 2
  end
end
