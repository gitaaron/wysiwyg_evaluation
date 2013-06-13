class HTMLValidator 
	include Capybara::DSL

    @html = nil

    def getHtml(editor)
    	@html = cleanUpParsedHtml(editor.getHtml())
    end

    def assignIframeName(editor)
    	editor.assignIframeName()
	end

	def checkTextIsStyle(text, style, editor)
		assignIframeName(editor)
		name = page.evaluate_script("$('.wysihtml5-sandbox')[0].getAttribute('name')")
		within_frame(name) do
			page.find('body').has_css?(editor.getStyle(style), :text => text).should == true 	
		end
	end

	def checkTextIsColour(text, colour, editor)
		assignIframeName(editor)
		within_frame(editor.getEditorName()) do
			page.find('body').has_css?('span.wysiwyg-color-'+colour, :text => text).should == true
		end
	end

	def checkForEmptyTags(style, editor)
		assignIframeName(editor)
		within_frame(editor.getEditorName()) do 
			page.find('body').has_css?(editor.getStyle(style), "").should_not == true
		end
	end

	#check the html in the editor to verify that it is the expected result
	def validateHtml(editor, expectedValue)	
		getHtml(editor)
		@html.should == expectedValue
	end

	def matchStandardResponse(editor, responseNo)
		getHtml(editor)
		@html.should == STANDARD_RESPONSES[responseNo]
	end

	# clean up html that has been escaped by the editor (for easier testing)
	def cleanUpParsedHtml(html)
		# remove the byte order mark that may be found in obtained html
		# we probably should not have to do this, and instead fix issues with character encoding in the editor
		# solution taken from http://stackoverflow.com/questions/5011504/is-there-a-way-to-remove-the-bom-from-a-utf-8-encoded-file
		html.gsub!("\xEF\xBB\xBF".force_encoding("UTF-8"), '')

		cleanHtml = html
		cleanHtml.gsub!(/\&nbsp;/, ' ')
		cleanHtml.gsub!(/\&lt;/, '<')
		cleanHtml.gsub!(/\&rt;/, '>')

		return cleanHtml
	end

end