class App
  module Views
    class Index < Layout
		def task_description
			@task_description
		end
		def title
			@title
		end
		def definitions
			@definitions
		end
		def puzzle_items
			@puzzle_items
		end
    end
  end
end