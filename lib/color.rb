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


	def self.list_sneaker_by_color(sneaker_id)
		results = DB.exec("SELECT color.* FROM sneaker JOIN sneaker_colorway ON (sneaker_colorway.sneaker_id = sneaker.id)" +
			"JOIN color ON (color.id = sneaker_colorway.color_id) WHERE sneaker.id = #{sneaker_id};")
	
		colors = []

		results.each do |color|
			color_name = color['name']
			colors << Color.new({:name => color_name})
		end
		colors
	end

end