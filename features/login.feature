Feature: User Login

  Background:
    Given the database is seeded
    And I am on the login page

  @smoke @login
  Scenario: Successful login
    When I fill in "Email" with "user@test.com"
    And I fill in "Password" with "password"
    And I click "Log in"
    Then I should see "Welcome"

  @admin
  Scenario: Admin sees dashboard
    When I fill in "Email" with "admin@test.com"
    And I fill in "Password" with "password"
    And I click "Log in"
    Then I should see "Admin Dashboard"

  Scenario Outline: Login with different roles
    Given I login as "<role>"
    Then I see "<page>"

    Examples:
      | role  | page            |
      | admin | Admin Dashboard |
      | user  | Welcome         |

  Scenario: Login with data table
    Given the following users exist:
      | email           | password | role  |
      | admin@test.com  | password | admin |
      | user@test.com   | password | user  |
    When I fill in "Email" with "user@test.com"
    And I fill in "Password" with "password"
    And I click "Log in"
    Then I should see "Welcome"