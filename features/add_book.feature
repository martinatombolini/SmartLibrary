Feature: Library can create a new book
	As a Library
	I want to create a new book
	So that I can see the book on the homepage

Scenario: Create a new book
	Given I am a Library
	When I visit the profile page
    And I press "Add a book"
	And I fill in "Title" with "Title"
	And I fill in "Author" with "Author"
    And I fill in "Notes" with "Notes"
    And I fill in "Isbn" with "1234567890123"
	When I press "Create Book"
	Then I should be on the book details page
