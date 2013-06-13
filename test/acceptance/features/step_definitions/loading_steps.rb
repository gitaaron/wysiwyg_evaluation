Given /^I am on the editor page$/ do
  visit("/index.html")
end

Then /^I should see the header$/ do 
	header_elem = page.find('header').find('h1')
	header_elem.text.should have_content('Html Editor Prototypes')
end
	






