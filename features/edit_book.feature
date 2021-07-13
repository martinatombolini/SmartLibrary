Feature: Library can edit a book
	As a Library
	I want to edit a book
	So that I can SEE THE EDITED BOOK ON THE HOMEPAGE

Scenario: Can edit a post
    Given I am a Library
	And There is at least one book
	And I am the owner of the book
	And I am on the book index page
	When I click "Edit"
	Then I should be on the book edit page
	And I fill in "Title" with "New title"
	And I fill in "Author" with "Author"
    And I fill in "Notes" with "Notes"
    And I fill in "Isbn" with "1234567890123"
	When I press "Update Book"
	Then I should be on the book details page
    When I visit the homepage
    Then I should see "New title"

Scenario: Cannot edit a book
	Given I am a Reader
    And There is at least one book
	And I am on the book index page
	And I should not see "Edit"