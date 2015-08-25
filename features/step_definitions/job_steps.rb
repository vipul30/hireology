Given(/^I am on the add new job page$/) do
  visit '/job/new'
end

When(/^I fill in new job form$/) do
  fill_in('job_title', :with => "Awesome Programmer Position")
  fill_in('job_location', :with => "Chicago, IL")
  fill_in('job_description', :with => "This is the most amazing job in the world.")
  click_button("Submit")
end

Then /^page should have (.+) message "([^\"]*)"$/ do |type, text|
  page.has_css?("p.#{type}", :text => text, :visible => true)
end

  Given(/^I am on the update job page$/) do
  visit '/job/index_admin'
  
  first(:link, 'Edit').click

end

When(/^I update the job form$/) do
  
  fill_in('job_title', :with => "Another Awesome Programmer Position")
  fill_in('job_location', :with => "Los Angeles, Ca")
  fill_in('job_description', :with => "This is an updated version of the job description.")
  click_button("Submit")
end
