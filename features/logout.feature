Feature: User can logout to the system
  As a registered user
  So that I can finish my session
  I want to log out

Scenario: Logout
  Given I am a Library
  When I visit the profile page
  And I press "Logout"
  Then I should see "Notification: Signed out successfully."
