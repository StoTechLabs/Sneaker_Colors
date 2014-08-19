class Sneaker

	attr_reader :brand, :style

	def initialize(attributes)
		@brand = attributes[:brand]
		@style = attributes[:style]
	end 

	def save
		saved_sneakers = DB.exec("INSERT INTO sneaker (brand, style) VALUES ('#{brand}', '#{style}');")
	end

	def Sneaker.all 
		sneakers = []
		saved_sneakers = DB.exec("SELECT * FROM sneaker")
		saved_sneakers.each do |sneaker|
			brand = sneaker['brand']
			style = sneaker['style']
			sneakers << Sneaker.new({:brand => brand, :style => style})
		end
		sneakers
	end

	def ==(another_sneaker)
		self.brand == another_sneaker.brand && self.style == another_sneaker.style
	end

end