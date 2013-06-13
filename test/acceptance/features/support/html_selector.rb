class HTMLSelector
	include Capybara::DSL

	# define text selection JS function
	# not certain if there is a simpler way that capybara can do this
	def setupSelectFunction(editor)

		page.execute_script("
			selectText = function(el, start, end){
				var sel = "+editor.iFramePathString()+".getSelection();
			    var range = window.document.createRange();
			    range.setStart(el, start);
			    range.setEnd(el, end);
			    sel.removeAllRanges();
			    sel.addRange(range);
			}
		")
	end

	# select some specified text in the first (innermost) html element in the editor 
	def selectHTMLByText(text, editor)
		self.setupSelectFunction(editor)
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

	# place the caret at the specified index
	def placeCursorAtIndex(index, editor)
		self.setupSelectFunction(editor)
		page.execute_script("
			var textarea = $('.wysihtml5-sandbox').contents().find('body')[0];
			var el = textarea.firstChild;
			selectText(el, #{index}, #{index})
			")
	end

	def placeCursorBeforeText(text, editor)
		self.setupSelectFunction(editor)
		 page.execute_script("var textarea = $('.wysihtml5-sandbox').contents().find('body')[0];
			var textToSelect = '#{text}';
			var el = textarea.firstChild;

			//finds the innermost html element  
			while(el.outerHTML){
				console.log('iterated once');
				el = el.firstChild;
			}

			var startInd = el.textContent.search(textToSelect);
			selectText(el, startInd, startInd)
			")
	end

		
end