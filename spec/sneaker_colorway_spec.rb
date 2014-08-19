require 'spec_helper'

describe 'Sneaker_Colorway' do

	describe 'initialize' do
		it 'initializes a new sneaker colorway with a sneaker id and color id' do
			test_colorway = Sneaker_Colorway.new({:sneaker_id => 1, :color_id => 2})
			expect(test_colorway).to be_an_instance_of Sneaker_Colorway
		end
	end
	





end