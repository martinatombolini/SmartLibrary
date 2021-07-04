Feature: User can create a new account
  As an unregistered user
  So that I can become a user
  I want to sign up to the system

Scenario: Sign up success
  Given I am on the sign up page
  When I fill in "Username" with "simona"
  And I fill in "Email" with "simona.lai@gmail.com"
  And I fill in "Password" with "123456"
  And I fill in "user[password_confirmation]" with "123456"
  And I press "Sign up"
  Then I should be on the profile page

Scenario: Sign up failed (email required)
  Given I am on the sign up page
  When I fill in "Username" with "simona"
  And I fill in "Password" with "123456"
  And I fill in "user[password_confirmation]" with "123456"
  And I press "Sign up"
  Then I should see "Email can't be blank"