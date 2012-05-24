require 'spec_helper'

describe "reagents/edit" do
  before(:each) do
    @reagent = assign(:reagent, stub_model(Reagent,
      :name => "MyString",
      :description => "MyString",
      :transcription_factor => nil,
      :source => nil,
      :reagent_type => nil
    ))
  end

  it "renders the edit reagent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reagents_path(@reagent), :method => "post" do
      assert_select "input#reagent_name", :name => "reagent[name]"
      assert_select "input#reagent_description", :name => "reagent[description]"
      assert_select "input#reagent_transcription_factor", :name => "reagent[transcription_factor]"
      assert_select "input#reagent_source", :name => "reagent[source]"
      assert_select "input#reagent_reagent_type", :name => "reagent[reagent_type]"
    end
  end
end
