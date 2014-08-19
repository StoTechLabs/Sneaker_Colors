require "spec_helper"

describe Sneaker do 

	describe "initialize" do
		it 'should initialize sneaker class with a brand and style' do
			test_sneaker = Sneaker.new({:brand => 'Nike'});
			expect(test_sneaker).to be_an_instance_of Sneaker
		end
	end



	
end