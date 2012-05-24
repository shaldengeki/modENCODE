require 'spec_helper'

describe "transcription_factors/new" do
  before(:each) do
    assign(:transcription_factor, stub_model(TranscriptionFactor,
      :name => "MyString",
      :flybase_id => "MyString",
      :cg_id => "MyString",
      :refseq_id => "MyString"
    ).as_new_record)
  end

  it "renders new transcription_factor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transcription_factors_path, :method => "post" do
      assert_select "input#transcription_factor_name", :name => "transcription_factor[name]"
      assert_select "input#transcription_factor_flybase_id", :name => "transcription_factor[flybase_id]"
      assert_select "input#transcription_factor_cg_id", :name => "transcription_factor[cg_id]"
      assert_select "input#transcription_factor_refseq_id", :name => "transcription_factor[refseq_id]"
    end
  end
end
