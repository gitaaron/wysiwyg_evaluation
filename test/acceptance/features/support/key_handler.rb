class KeyHandler

	include Capybara::DSL

	def ctrlShortcut(element, key)
		element.native.send_keys [:control, key]
	end

	#testing native shortcuts for mac 
	def macNativeShortcut(element, key)
		element.native.send_keys [:meta, key]
	end	

	def otherKeystrokes(element, key)
		element.native.send_keys key
	end
end