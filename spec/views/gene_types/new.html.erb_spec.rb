require 'spec_helper'

describe "gene_types/new" do
  before(:each) do
    assign(:gene_type, stub_model(GeneType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new gene_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gene_types_path, :method => "post" do
      assert_select "input#gene_type_name", :name => "gene_type[name]"
    end
  end
end
