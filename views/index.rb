class App
  module Views
    class Index < Layout
		def task_description
			@task_description
		end
		def title
			@title
		end
		def questions
			@questions
		end
    end
  end
end