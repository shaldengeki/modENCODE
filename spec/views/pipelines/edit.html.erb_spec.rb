require 'spec_helper'

describe "pipelines/edit" do
  before(:each) do
    @pipeline = assign(:pipeline, stub_model(Pipeline,
      :name => "MyString",
      :description => "MyString",
      :source => nil,
      :reagent_type => nil
    ))
  end

  it "renders the edit pipeline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pipelines_path(@pipeline), :method => "post" do
      assert_select "input#pipeline_name", :name => "pipeline[name]"
      assert_select "input#pipeline_description", :name => "pipeline[description]"
      assert_select "input#pipeline_source", :name => "pipeline[source]"
      assert_select "input#pipeline_reagent_type", :name => "pipeline[reagent_type]"
    end
  end
end
