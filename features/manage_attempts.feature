Feature: Manage Attempts
  In order to track sequencing progress
  As a user
  I want to create and manage attempts

  Scenario: Attempts list
    Given I have 3 attempts
    When I go to the list of attempts
    Then I should see 3 attempts

  Scenario: Unauthorized attempt creation
    Given I am not logged in
    And I go to the list of attempts
    When I press "Start an attempt"
    Then I should see "You are not allowed to perform new on Attempt."
    And I should have 0 attempts

  @javascript
  Scenario: Attempt create
    Given I have some test data
    And I log in as "normal_user@gmail.com" with password "secret"
    And I have 0 attempts
    And I go to the list of attempts
    When I press "Start an attempt"
    And I provide valid attempt parameters
    And I press "Start attempt"
    Then I should see "Attempt was successfully created."
    And I should have 1 attempt