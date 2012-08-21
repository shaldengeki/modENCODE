require 'spec_helper'

describe "gene_types/show" do
  before(:each) do
    @gene_type = assign(:gene_type, stub_model(GeneType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
