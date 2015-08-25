Feature: Manage Jobs
	As a recruiter I want to create and update jobs

Scenario: Add a new job
	Given I am on the add new job page
    When I fill in new job form
    Then page should have notice message " has been saved."

 Scenario: Update a job
	Given I am on the update job page
    When I update the job form
    Then page should have notice message "Updated Job - "