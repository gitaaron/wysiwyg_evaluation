class HTMLValidator 
	include Capybara::DSL

    @html = nil

    def getHtml()
    	@html = cleanUpParsedHtml(page.evaluate_script("$('.wysihtml5-sandbox').contents().find('body')[0].innerHTML"))
    end

	def checkTextIsStyle(text, style)
		getHtml()
		match = STYLE_TAGS[style+"_start"] + text + STYLE_TAGS[style+"_end"]
		exp = Regexp.new match

		(@html =~ exp).should_not == nil
	end

	#check the html in the editor to verify that it is the expected result
	def validateHtml(expectedValue)	
		getHtml()
		@html.should == expectedValue
	end

	def matchStandardResponse(responseNo)
		getHtml()
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