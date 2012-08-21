Given /^I have ([0-9]+) attempts$/ do |num|
  Attempt.delete_all
  source = Source.find_or_create_by_name("test source")
  pipeline = Pipeline.find_or_create_by_name_and_source_id("test pipeline", source.id)
  reagent_type = ReagentType.find_or_create_by_name("test reagent type")
  reagent = Reagent.find_or_create_by_name_and_reagent_type_id_and_source_id("test reagent", reagent_type.id, source.id)
  num.to_i.times do
    Attempt.create!(:reagent_id => reagent.id, :pipeline_id => pipeline.id)
  end
end

When /^I go to the list of attempts$/ do
  visit attempts_path
end

Then /^I should see ([0-9]+) attempts$/ do |num|
  page.all('table#attempt-search tr').count.should >= num.to_i
end

When /^I press "([^\"]*)"$/ do |link_name|
  click_on link_name
end

When /^I provide valid attempt parameters$/ do
  # fill_in "Gene name", :with => "CG11398"
  pending
  page.execute_script "$('input#Gene_id').focus().val('test gene').keydown()"
  sleep 1
  # find('ul.ui-autocomplete').has_content?("CG11398")
  page.execute_script("$('.ui-menu-item:contains(\"test gene\")').find('a').trigger('mouseenter').click()")
  # click_on "isoform_1565"
  # find(:xpath, "//input[@name='isoforms_json']").set "['1565', '1567']"
  sleep 1
  page.execute_script("$('.isoform_checkbox').each(function() {$(this).click();});")
  # find(:css, ".isoform_checkbox").set(true)
  wait_until { page.find("#attempt_reagent_id").visible? }
  find(:css, "#attempt_reagent_id")
  fill_in "attempt[reagent_id]", :with => "1"
  fill_in "attempt[pipeline_id]", :with => "1"
  fill_in "attempt_statuses_attributes_0_step_id", :with => "1"
  fill_in "attempt[statuses_attributes][0][description]", :with => "test description"
  fill_in "attempt[statuses_attributes][0][failure]", :with => "1"
  fill_in "attempt[attempt_values_attributes][0][attempt_attribute_attributes][name]", :with => "test attribute"
  fill_in "attempt[attempt_values_attributes][0][value]", :with => "test value"
  fill_in "attempt[started_at]", :with => "2012-08-16 12:14:04"
  fill_in "attempt[user_tokens]", :with => "1"
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end

Then /^I should have ([0-9]+) attempts?$/ do |count|
  Attempt.count.should == count.to_i
end