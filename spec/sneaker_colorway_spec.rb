require 'spec_helper'

describe 'Sneaker_Colorway' do

	describe 'initialize' do
		it 'initializes a new sneaker colorway with a sneaker id and color id' do
			test_colorway = Sneaker_Colorway.new({:sneaker_id => 1, :color_id => 2})
			expect(test_colorway).to be_an_instance_of Sneaker_Colorway
		end

		it 'should display attributes when they are called on the class' do
			test_colorway = Sneaker_Colorway.new({:sneaker_id => 1, :color_id => 2})
			expect(test_colorway.sneaker_id).to eq 1
		end
	end

	describe 'Sneaker_Colorway.all' do
		it 'should return all of the saved sneaker colorways' do
			test_colorway = Sneaker_Colorway.new({:sneaker_id => 1, :color_id => 2})
			test_colorway.save
			expect(Sneaker_Colorway.all).to eq [test_colorway]
		end
	end

	describe 'save' do
		it 'should set the id number when the Sneaker_Colorway is saves into the database' do
			test_colorway = Sneaker_Colorway.new({:sneaker_id => 1, :color_id => 2})
			test_colorway.save
			expect(test_colorway.id).to be_an_instance_of Fixnum
		end
	end



end