require 'spec_helper'

describe "attempts/edit" do
  before(:each) do
    @attempt = assign(:attempt, stub_model(Attempt,
      :pipeline => nil,
      :status => nil,
      :reagent => nil
    ))
  end

  it "renders the edit attempt form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attempts_path(@attempt), :method => "post" do
      assert_select "input#attempt_pipeline", :name => "attempt[pipeline]"
      assert_select "input#attempt_status", :name => "attempt[status]"
      assert_select "input#attempt_reagent", :name => "attempt[reagent]"
    end
  end
end
