class Data

	STYLE_LABELS = 
	{
		"bold" => "b",
		"underline" => "u",
		"italic" => "i",
		"list item" => "li",
		"unordered list" => "ul",
		"header 1" => "h1",
		"header 2" => "h2",
		"header 3" => "h3",
		"header 4" => "h4",
		"header 5" => "h5",
		"header 6" => "h6",
		"indented" => "blockquote"
	}

	def self.getStyle(selector)
		STYLE_LABELS[selector]
	end

end
