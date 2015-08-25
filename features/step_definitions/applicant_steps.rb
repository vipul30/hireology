Given(/^I am on the apply for a job page$/) do
  visit '/job/index'
  first('.button_to').click_button('Apply Now')
end

When(/^I fill in the job application form$/) do
  fill_in('applicant_first_name', :with => "Mike")
  fill_in('applicant_last_name', :with => "Jones")
  fill_in('applicant_email', :with => "mjones@gmail.com")
  fill_in('applicant_address', :with => "555 N Main St., Chicago, IL")  
  click_button("Submit")
end
