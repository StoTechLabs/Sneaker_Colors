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

	
end
