class Sneaker

	attr_reader :brand, :name

	def initialize(attributes)
		@brand = attributes[:brand]
		@style = attributes[:name]
	end 
	
end