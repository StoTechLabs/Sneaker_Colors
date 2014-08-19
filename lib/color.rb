class Color
	attr_reader :name

	def initialize(attributes)
		@name = attributes[:name]
	end

	def save
		saved_colors = DB.exec("INSERT INTO color (name) VALUES ('#{name}') RETURNING id;")
	end

	def Color.all 
		colors = []
		saved_colors = DB.exec("SELECT * FROM color")
		saved_colors.each do |color|
			name = color['name']
			colors << Color.new({:name => name})
		end
		colors
	end

	def ==(another_color)
		self.name == another_color.name
	end

	
end