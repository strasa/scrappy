Feature: list projects
  So that I feel a sense of personal accomplishment
  I want to show a list of all my scrapped projects

  Scenario: one or more projects
    Given I am a regular user
    And I am logged in
    And I have a Project
    Then I should see that Project
