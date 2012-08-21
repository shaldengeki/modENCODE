Given /^I go to the signup page$/ do
  visit signup_path
end

Given /^a normal user exists$/ do
  if User.find_by_email("normal_user@gmail.com").nil?
    FactoryGirl.create(:user, :email => "normal_user@gmail.com", :role => "normal")
  end
end

Given /^I log in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  unless username.blank?
    visit signout_path
    click_on "Sign in"
    fill_in "Email", :with => username
    fill_in "Password", :with => password
    click_button "Sign in"
  end
end

Given /^I am not logged in$/ do
  visit signout_path
end

Given /^I log out$/ do
  visit signout_path
end