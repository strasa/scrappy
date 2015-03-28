Feature: create a scrappy project
  So that I can improve my efficiency as a scrapper
  I want to be able to create projects to track what I have scrapped

  Scenario: no projects
    Given I am a regular user
    And I am logged in
    When I create a Project
    Then I should see that Project

