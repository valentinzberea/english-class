class App
  module Views
    class Response < Layout
		def question_text
			@question[:text]
		end
		def response_hint
			@question[:hint]
		end
		def question_num
			@question[:num]
		end
    end
  end
end