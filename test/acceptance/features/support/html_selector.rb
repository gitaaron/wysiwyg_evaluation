class HTMLSelector
	include Capybara::DSL

	#define text selection JS function
	#not certain if there is a simpler way that capybara can do this
	def setupSelectFunction()
		page.execute_script("
			selectText = function(el, start, end){
				var sel = window.getSelection();
			    var range = window.document.createRange();
			    range.setStart(el, start);
			    range.setEnd(el, end);
			    sel.removeAllRanges();
			    sel.addRange(range);
			}
		")
	end

	#select a specified word in the first (innermost) html element in the editor 
	def selectHTMLByText(text)
		self.setupSelectFunction()
		page.execute_script("
			var textarea = $('.wysihtml5-sandbox').contents().find('body')[0];
			var textToSelect = '#{text}';
			var el = textarea.firstChild;

			//finds the innermost html element  
			while(el.outerHTML){
				el = el.firstChild;
			}

			var startInd = el.textContent.search(textToSelect);
			var endInd = startInd + textToSelect.length;
		    selectText(el, startInd, endInd)
		    ")
	end

	#place the caret at the specified index
	def placeCursorAtIndex(index)
		self.setupSelectFunction()
		page.execute_script("
			var textarea = $('.wysihtml5-sandbox').contents().find('body')[0];
			var el = textarea.firstChild;
			selectText(el, #{index}, #{index})
			")
	end

	#check the html in the editor to verify that it is the expected result
	def validateHtml(expectedValue)
		html = evaluate_script("$('.wysihtml5-sandbox').contents().find('body')[0].innerHTML")
		#remove the BOM that may be found in obtained html
		#we probably should not have to do this, and instead fix issues with character encoding in the editor
		html.gsub!("\xEF\xBB\xBF".force_encoding("UTF-8"), '')
		html.gsub!(/\&nbsp;/, ' ')
		html.should == expectedValue
	end
	
end