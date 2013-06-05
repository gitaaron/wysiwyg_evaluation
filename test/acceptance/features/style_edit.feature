Feature: 
	I want to be able to edit text style

	Background:
		Given I am on the editor page
		And I click the bootstrap-wysihtml5 editor area

	Scenario: select some text and make it bold in bootstrap-wysihtml5
		And I insert the text "I want this text to be bold"
		And I select the text "bold"
		And I click the bold style button
		Then the html should be "I want this text to be <b>bold</b>"

	Scenario: using a shortcut should change the style
		And I insert the text "I want this text to be underlined"
		And I select the text "underlined"
		And I use the Ctrl+u keyboard shortcut
		Then the html should be "I want this text to be <u>underlined</u>"

	Scenario: removing a style
		And I click the italic style button
		And I type "This text should not be italicized"
		Then the html should be "<i>This text should not be italicized</i>"
		And I select the text "This text should not be "
		And I click the italic style button
		Then the html should be "This text should not be <i>italicized</i>"

	Scenario: cleaning up style html
		And I type "This text is not bold yet"
		And I click the bold style button
		And I type "this text is bold"
		Then the html should be "This text is not bold yet<b>this text is bold</b>"
		And I select the text "This text is not bold yet"
		And I click the bold style button
		Then the html should be "<b>This text is not bold yetthis text is bold</b>"

