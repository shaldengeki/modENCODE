require 'spec_helper'

describe "attempts/new" do
  before(:each) do
    assign(:attempt, stub_model(Attempt,
      :pipeline => nil,
      :status => nil,
      :reagent => nil
    ).as_new_record)
  end

  it "renders new attempt form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attempts_path, :method => "post" do
      assert_select "input#attempt_pipeline", :name => "attempt[pipeline]"
      assert_select "input#attempt_status", :name => "attempt[status]"
      assert_select "input#attempt_reagent", :name => "attempt[reagent]"
    end
  end
end
