html_selector = HTMLSelector.new
html_validator = HTMLValidator.new
key_handler = KeyHandler.new

Given /^I am on the editor page$/ do
  visit("/index.html")
end

Then /^I should see the header$/ do 
	header_elem = page.find('header').find('h1')
	header_elem.text.should have_content('Html Editor Prototypes')
end
	
And /^I click the bootstrap-wysihtml5 editor area$/ do
	page.find('.wysihtml5-sandbox').click()
end

And /^I click insert field (.*)$/ do |insertField|

	page.find(:xpath, '//div[@id="wysihtml5-insert-container"]/div/div/div['+insertField+']/div/pre').click()
end

And /^I click to show html$/ do	
	page.find(:xpath, '//a[@data-wysihtml5-action="change_view"]').click()
end

And /^I insert the text "(.*)"$/ do |text|
	page.execute_script(
		"var text = '#{text}';
		g_wysiEditor.editor.currentView.commands.exec('insertHTML', text);")
end

And /^I select the text "(.*)"$/ do |text|
	html_selector.selectHTMLByText(text)
end

And /^I place the cursor at index (.*)$/ do |index|
	html_selector.placeCursorAtIndex(index)
end

And /^I place the cursor before the text "(.*)"$/ do |text|
	html_selector.placeCursorBeforeText(text)
end	

And /^I click the (.*) style button$/ do |style|
	xpath = "//a[@data-wysihtml5-command=\""+style+"\"]"
	page.find(:xpath, xpath).click()
end

And /^I use the Ctrl+(.*) keyboard shortcut$/ do |shortcut|
	key_handler.ctrlShortcut(page.find('.wysihtml5-sandbox'), shortcut)
end

And /^I use the Cmd+(.*) keyboard shortcut$/ do |shortcut|
	key_handler.macNativeShortcut(page.find('.wysihtml5-sandbox'), shortcut)
end

And /^I type "(.*)"$/ do |keystrokes|
	key_handler.otherKeystrokes(page.find('.wysihtml5-sandbox') ,keystrokes)
end

Then /^the editors html should be set to the (.*) standard response$/ do |responseId|
	html = evaluate_script("$('.wysihtml5-sandbox').contents().find('body').html()")
	html.should == STANDARD_RESPONSES[responseId]
end

Then /^the html should be "(.*)"$/ do |expectedHtml|
	html_validator.validateHtml(expectedHtml)
end

Then /^the text "(.*)" should be set to (.*)$/ do |text, style|
	page.execute_script("$('.wysihtml5-sandbox')[0].setAttribute('name', 'wysihtml5')")
	within_frame('wysihtml5') do
		page.find('body').has_css?(STYLE_LABELS[style], :text => text).should == true 	
	end
end


	



