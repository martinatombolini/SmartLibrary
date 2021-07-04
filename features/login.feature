Feature: User can login to the system
  As a registered user
  So that I can interact with the system
  I want to log in the system

Scenario: Login success
  Given I am a registered reader
  When I am on the login page
  And I fill in "Email" with "simona.lai@gmail.com"
  And I fill in "Password" with "123456"
  And I press "Log in"
  Then I should be on the profile page

Scenario: Login failed
  Given I am on the login page
  When I fill in "Email" with "pippoplutopaperino@gmail.com"
  And I fill in "Password" with "123456"
  And I press "Log in"
  Then I should see "Notification: Invalid Email or password."