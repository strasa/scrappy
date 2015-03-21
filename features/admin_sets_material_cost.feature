Feature: Admin adds material cost
  So that scrappers can value their scrapped projects
  As an Admin I want to be able to set material prices
  that can be used to compute those values.

Scenario: Successful Admin Material Price Update
    Given I am an Admin
    And I am logged in
    When I go to the Change Material Price Page
    And I update the price of Copper
    Then I should see that updated price on the Materials Page
