require "spec_helper"

describe Sneaker do 

	describe "initialize" do
		it 'should initialize sneaker class with a brand and style' do
			test_sneaker = Sneaker.new({:brand => 'Nike', :style => 'Yeezy'})
			expect(test_sneaker).to be_an_instance_of Sneaker
		end

		it 'should display atributes when they are called on the class' do
			test_sneaker = Sneaker.new({:brand => 'Nike', :style => 'Yeezy'})
			expect(test_sneaker.brand).to eq 'Nike'
		end

	end







	
end