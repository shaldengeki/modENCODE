require 'spec_helper'

describe "gene_types/index" do
  before(:each) do
    assign(:gene_types, [
      stub_model(GeneType,
        :name => "Name"
      ),
      stub_model(GeneType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of gene_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
