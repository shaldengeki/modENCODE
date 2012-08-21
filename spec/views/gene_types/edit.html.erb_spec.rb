require 'spec_helper'

describe "gene_types/edit" do
  before(:each) do
    @gene_type = assign(:gene_type, stub_model(GeneType,
      :name => "MyString"
    ))
  end

  it "renders the edit gene_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gene_types_path(@gene_type), :method => "post" do
      assert_select "input#gene_type_name", :name => "gene_type[name]"
    end
  end
end
