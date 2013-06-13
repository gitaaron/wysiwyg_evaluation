Feature: 
	I want to be able to insert formatted text into the editor


	Background: 
		Given I am on the editor page
		And I am using the tinymce editor
		And I click the tinymce editor area

	@insertion
	Scenario: Insert some text into tinymce
		When I click insert field 1
		And I click to show html
		Then the editors html should be set to the first standard response

	@insertion
	Scenario: use the second insert field
		When I click insert field 2
		And I click to show html
		Then the editors html should be set to the second standard response

	@insertion
	Scenario: use the third insert field	
		When I click insert field 3
		And I click to show html
		Then the editors html should be set to the third standard response

	@insertion
	Scenario: I want to insert some plain text in the middle of already existing text
		When I insert the text "Insert <=here"
		And I place the cursor before the text "<=here"
		And I click insert field 3
		Then the html should be "Insert here is some plain text<=here"

	@insertion
	Scenario: I want to insert HTML in the middle of already existing text
		Then I insert the text "Insert <=here"
		And I place the cursor before the text "<=here"
		And I click insert field 1
		Then the html should be "Insert <h1>here is a heading</h1>and another span<=here"