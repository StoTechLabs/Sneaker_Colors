class Color
	attr_reader :name, :id

	def initialize(attributes)
		@name = attributes[:name]
		@id = attributes[:id]
	end

	def save
		saved_colors = DB.exec("INSERT INTO color (name) VALUES ('#{name}') RETURNING id;")
		@id = saved_colors.first['id'].to_i
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