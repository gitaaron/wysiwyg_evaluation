Feature: 
	I want to be able to insert formatted text into the editor

	Scenario: Insert some text into bootstrap-wysihtml5
		Given I am on the editor page
		And I click the bootstrap-wysihtml5 editor area
		And I click insert field 1
		And I click to show html
		Then the editors html should be set to the first standard response

	Scenario: use the second insert field
		Given I am on the editor page
		And I click the bootstrap-wysihtml5 editor area
		And I click insert field 2
		And I click to show html
		Then the editors html should be set to the second standard response

	Scenario: use the third insert field	
		Given I am on the editor page
		And I click the bootstrap-wysihtml5 editor area
		And I click insert field 3
		And I click to show html
		Then the editors html should be set to the third standard response
