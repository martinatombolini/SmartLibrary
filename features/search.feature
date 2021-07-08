Feature: Users can search a book
  As a user
  So that I can search a book
  I want search a title

Scenario: Search
  Given I visit the homepage
  When I fill in "q" with "prova"
  And I press "Search"
  Then I should be on the search page
  And I should see "No results found."