Feature: Apply for Jobs
	As a job applicant I want to apply for a job

Scenario: Add a new job
	Given I am on the apply for a job page
    When I fill in the job application form
    Then page should have notice message "Someone from our amazing team will be in touch with you soon."
