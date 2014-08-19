require 'spec_helper'

describe Color do 

	describe "initalized" do
		it "should initalize the color class with a name of a color" do
			test_color = Color.new({:name => 'Solar Red'})
			expect(test_color).to be_an_instance_of Color
		end
	
	it 'should display attributes when they are called on the class' do
			test_color = Color.new({:name => 'Solar Red'})
			expect(test_color.name).to eq 'Solar Red'
		end
	end

	describe 'Color.all' do
		it 'shoud return all of the saved colors' do
			test_color = Color.new({:name => 'Solar Red'})
			test_color.save
			expect(Color.all).to eq [test_color]
		end
	end
	
	describe 'save' do
		it 'should set the id when the color is saved into the datebase' do
			test_color = Color.new({:name => 'Solar Red'})
			test_color.save
			expect(test_color.id).to be_an_instance_of Fixnum
		end
	end


	
end
