Feature: show project
  So that I review project details
  I want to see a detail view for my project

  Scenario: one or more projects
    Given I am a regular user
    And I am logged in
    And I have a Project
    When I view the project's detail page
    Then I should see the project's details
