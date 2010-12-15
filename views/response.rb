class App
  module Views
    class Response < Layout
		def definition_text
			@definition[:text]
		end
		def response_hint
			@definition[:hint]
		end
		def definition_num
			@definition[:num]
		end
    end
  end
end