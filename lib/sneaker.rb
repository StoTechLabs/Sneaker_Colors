class Sneaker

	attr_reader :brand, :style, :id

	def initialize(attributes)
		@brand = attributes[:brand]
		@style = attributes[:style]
		@id = attributes[:id]
	end 

	def save
		saved_sneakers = DB.exec("INSERT INTO sneaker (brand, style) VALUES ('#{brand}', '#{style}') RETURNING id;")
		@id = saved_sneakers.first['id'].to_i
	end

	def Sneaker.all 
		sneakers = []
		saved_sneakers = DB.exec("SELECT * FROM sneaker")
		saved_sneakers.each do |sneaker|
			brand = sneaker['brand']
			style = sneaker['style']
			id = sneaker['id'].to_i
			sneakers << Sneaker.new({:id => id, :brand => brand, :style => style})
		end
		sneakers
	end

	def ==(another_sneaker)
		self.brand == another_sneaker.brand && self.style == another_sneaker.style
	end

end