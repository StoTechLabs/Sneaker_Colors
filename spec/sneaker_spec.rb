require "spec_helper"

describe Sneaker do 

	describe "initialize" do
		it 'should initialize sneaker class with a brand and style' do
			test_sneaker = Sneaker.new({:brand => 'Nike', :style => 'Yeezy'})
			expect(test_sneaker).to be_an_instance_of Sneaker
		end

		it 'should display attributes when they are called on the class' do
			test_sneaker = Sneaker.new({:brand => 'Nike', :style => 'Yeezy'})
			expect(test_sneaker.brand).to eq 'Nike'
		end
	end

	describe 'Sneaker.all' do
		it 'shoud return all of the saved sneakers' do
			test_sneaker = Sneaker.new({:brand => 'Nike', :style => 'Yeezy'})
			test_sneaker.save
			expect(Sneaker.all).to eq [test_sneaker]
		end
	end

	describe 'save' do
		it 'should set the id when the sneaker is saved into the datebase' do
			test_sneaker = Sneaker.new({:brand => 'Nike', :style => 'Yeezy'})
			test_sneaker.save
			expect(test_sneaker.id).to be_an_instance_of Fixnum
		end
	end
end

