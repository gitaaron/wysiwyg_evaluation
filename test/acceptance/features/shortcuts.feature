Feature: I want to be able to use keyboard shortcuts

	Background:
		Given I am on the editor page 
		And I click the bootstrap-wysihtml5 editor area

	Scenario: Using undo and redo to change text
		When I type "I want to undo the last word of this sentence word"
		And I use the Ctrl+z keyboard shortcut
		Then the html should be "I want to undo the last word of this sentence "
		And I use the Ctrl+y keyboard shortcut
		Then the html should be "I want to undo the last word of this sentence word"

	Scenario: Using undo to change style modifications
		When I insert the text "We are going to change the style of this"
		And I select the text "style"
		And I click the underline style button
		Then the html should be "We are going to change the <u>style</u> of this"
		When I use the Ctrl+z keyboard shortcut
		Then the html should be "We are going to change the style of this"