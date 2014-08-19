class Sneaker_Colorway 

	attr_reader :sneaker_id, :color_id

	def initialize(attributes)
		@sneaker_id = attributes[:sneaker_id]
		@color_id = attributes[:color_id]
	end

end