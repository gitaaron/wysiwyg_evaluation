class Wysihtml5Editor

	include Capybara::DSL

	def editorPath()
		page.find('.wysihtml5-sandbox')
	end

	def iFramePathString()
		"$('.wysihtml5-sandbox')[0].contentWindow"
	end

	def getEditorName()
		'wysihtml5'
	end

	def getStyle(selector)
		Data.getStyle(selector)
	end

	def getHtml()
		page.evaluate_script("$('.wysihtml5-sandbox').contents().find('body')[0].innerHTML")
	end

	def assignIframeName()
		if(!page.evaluate_script("$('.wysihtml5-sandbox')[0].getAttribute('name')"))
			page.execute_script("$('.wysihtml5-sandbox')[0].setAttribute('name', 'wysihtml5')")
		end
	end

	def insertCommand(text)
		page.execute_script("
		var text = '#{text}';
		g_wysiEditor.editor.currentView.commands.exec('insertHTML', text);
		")
	end

	def styleButtonXpath(style)
		return "//a[@data-wysihtml5-command=\""+style+"\"]"
	end

	def getInsertFieldXpath(insertField)
		return '//div[@id="wysihtml5-insert-container"]/div/div/div['+insertField+']/div/pre'
	end

	def changeColour(colour)
		page.find(:xpath, "//ul[@class=\"wysihtml5-toolbar\"]/li[2]/a").click()
		page.find(:xpath, "//ul[@class=\"dropdown-menu\"]/li/a[@data-wysihtml5-command-value=\""+colour+"\"]").click()
	end

end


