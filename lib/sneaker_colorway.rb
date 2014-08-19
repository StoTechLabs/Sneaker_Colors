class Sneaker_Colorway 

	attr_reader :sneaker_id, :color_id

	def initialize(attributes)
		@sneaker_id = attributes[:sneaker_id]
		@color_id = attributes[:color_id]
	end

	def save
		saved_colorways = DB.exec("INSERT INTO sneaker_colorway (sneaker_id, color_id) VALUES ('#{sneaker_id}', '#{color_id}') RETURNING id;")
	end

	def Sneaker_Colorway.all 
		sneaker_colorways = []
		saved_colorways = DB.exec("SELECT * FROM sneaker_colorway")
		saved_colorways.each do |colorway|
			sneaker_id = colorway['sneaker_id'].to_i
			color_id = colorway['color_id'].to_i
			sneaker_colorways << Sneaker_Colorway.new({:sneaker_id => sneaker_id, :color_id => color_id})
		end
		sneaker_colorways
	end

	def ==(another_colorway)
		self.sneaker_id == another_colorway.sneaker_id && self.color_id == another_colorway.color_id
	end

end