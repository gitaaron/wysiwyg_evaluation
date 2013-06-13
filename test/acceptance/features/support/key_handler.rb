class KeyHandler

	include Capybara::DSL

	def ctrlShortcut(element, key)
		puts key
		element.native.send_keys [:control, key]
	end

	#testing native shortcuts for mac 
	def macNativeShortcut(element, key)
		puts key
		case key
		when 'x'
			puts "something"
			page.execute_script("
				var event = new Event('cut', true, false);
				$('.wysihtml5-sandbox').contents().find('body')[0].dispatchEvent(event);
				")

		when 'p'
			page.execute_script("
				var pasteevent = new Event('paste', true, false);
				$('.wysihtml5-sandbox').contents().find('body')[0].dispatchEvent(pasteevent);
				")
		end

		element.native.send_keys [:command, key]
	end	

	def otherKeystrokes(element, key)
		element.native.send_keys key
	end
end