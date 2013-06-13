class TinyMCE

	include Capybara::DSL

	def editorPath()
		page.find('#mce_0_ifr')
	end

	def getEditorName()
		'tinyMCE'
	end

	def getStyle(selector)
		Data.getStyle(selector)
	end

	def getHtml()
		page.evaluate_script("$('#mce_0_ifr').contents().find('body')[0].innerHTML")
	end

	def assignIframeName()
		if(!page.evaluate_script("$('#mce_0_ifr')[0].getAttribute('name')"))
			page.execute_script("$('#mce_0_ifr')[0].setAttribute('name', 'tinyMCE')")
		end
	end

	def insertCommand(text)
		page.execute_script("
		var text = '#{text}';
		tinymce.activeEditor.insertContent(text);
		")
	end

	def styleButtonXpath(style)
		return "//div[@aria-label=\""+style+"\"]/button"
	end

	def getInsertFieldXpath(insertField)
		return '//div[@id="tinymce-container"]/div/div/div['+insertField+']/div/pre'
	end

	def changeColour(colour)
		page.find(:xpath, "//ul[@class=\"wysihtml5-toolbar\"]/li[2]").click()
		page.find(:xpath, "//ul[@class=\"dropdown-menu\"]/li/a[@data-wysihtml5-command-value=\""+colour+"\"]").click()
	end

end
