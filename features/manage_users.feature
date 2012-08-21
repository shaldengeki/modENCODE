Feature: Manage Users
  In order to use this application
  As a user
  I want to create and manage my account

  Scenario: Guest unauthorized registration
    Given I am not logged in
    And I go to the signup page
    Then I should see "You are not allowed to perform new on User."

  Scenario: User unauthorized registration
    Given a normal user exists
    And I log in as "normal_user@gmail.com" with password "secret"
    And I go to the signup page
    Then I should see "You are not allowed to perform new on User."

  Scenario: User sign in
    Given a normal user exists
    And I am not logged in
    When I log in as "normal_user@gmail.com" with password "secret"
    Then I should see "Welcome, "

  Scenario: Guest sign out
    Given I am not logged in
    And I log out
    Then I should see "Successfully signed out."

  Scenario: User sign out
    Given a normal user exists
    And I log in as "normal_user@gmail.com" with password "secret"
    When I log out
    Then I should see "Successfully signed out."