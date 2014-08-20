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

	describe 'self.list_sneaker_by_color' do
		it 'should list all the colors of a selected sneaker' do
			test_sneaker = Sneaker.new({:brand => 'Nike', :style => 'Yeezy'})
			test_sneaker.save
			test_color = Color.new({:name => 'Solar Red'})
			test_color.save
			test_colorway = Sneaker_Colorway.new({:sneaker_id => test_sneaker.id, :color_id => test_color.id})
			test_colorway.save
			test_colors = Color.list_sneaker_by_color(test_sneaker.id)
			expect(test_colors.first).to eq test_color
		end
	end


	
end
