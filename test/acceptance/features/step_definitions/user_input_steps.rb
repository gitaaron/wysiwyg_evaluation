html_selector = HTMLSelector.new
key_handler = KeyHandler.new
html_validator = HTMLValidator.new


Given /^I am using the (.*) editor$/ do |editor|
	setupEditor(editor)
	puts @browser
end

And /^I click the .* editor area$/ do
	@editor.editorPath().click()
	# some hacky stuff here, but currently the best way for us to hand focus to the editor in firefox
		for i in 0..1 do
			page.find(:xpath, '//a[@data-wysihtml5-action="change_view"]').click()
		end
end

And /^I click insert field (.*)$/ do |insertField|
	xpath = @editor.getInsertFieldXpath(insertField)
	page.find(:xpath, xpath).click()
end

And /^I click to show html$/ do	
	page.find(:xpath, '//a[@data-wysihtml5-action="change_view"]').click()
end

And /^I insert the text "(.*)"$/ do |text|
	@editor.insertCommand(text)
end

And /^I select the text "(.*)"$/ do |text|
	html_selector.selectHTMLByText(text, @editor)
end

And /^I place the cursor at index (.*)$/ do |index|
	html_selector.placeCursorAtIndex(index, @editor)
end

And /^I place the cursor before the text "(.*)"$/ do |text|
	html_selector.placeCursorBeforeText(text, @editor)
end	

And /^I click the (.*) style button$/ do |style|
	xpath = @editor.styleButtonXpath(style)
	page.find(:xpath, xpath).click()
end

And /^I change the text colour to (.*)$/ do |colour|
	@editor.changeColour(colour)
end

And /^I use the Ctrl\+(.*) keyboard shortcut$/ do |shortcut|
	key_handler.ctrlShortcut(@editor.editorPath(), shortcut)
end

And /^I use the Cmd\+(.*) keyboard shortcut$/ do |shortcut|
	key_handler.macNativeShortcut(@editor.editorPath(), shortcut)
end

And /^I type "(.*)"$/ do |keystrokes|
	key_handler.otherKeystrokes(@editor.editorPath() ,keystrokes)
end


################# Validation steps #################


Then /^the editors html should be set to the (.*) standard response$/ do |responseId|
	html_validator.matchStandardResponse(@editor, responseId)
end

Then /^the html should be "(.*)"$/ do |expectedHtml|
	html_validator.validateHtml(@editor, expectedHtml)
end

Then /^the text "(.*)" should be set to (.*)$/ do |text, style|
	html_validator.checkTextIsStyle(text, style, @editor)
end

Then /^the text "(.*)" should be the colour (.*)$/ do |text, colour| 
	html_validator.checkTextIsColour(text, colour, @editor)
end

Then /^there should be no empty (.*) tags$/ do |tagname|
	html_validator.checkForEmptyTags(tagname, @editor)
end
