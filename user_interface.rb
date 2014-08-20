require './lib/sneaker'
require './lib/color'
require './lib/sneaker_colorway'
require 'pg'

DB = PG.connect(:dbname => 'sneaker_colorway')

@current_sneaker = nil
@current_color = nil
@current_sneaker_colorway = nil

def main_menu	
	system 'clear'
	puts "###SNEAKER INVENTORY/COLORWAY TRACKER###"
	puts "\n\n"
	puts "Press 'a' to add a Sneaker, press 'l' to list Sneakers, press 'x' to exit"
	user_choice = gets.chomp
		if user_choice == 'a'
			add_sneaker
		elsif user_choice == 'l'
			list_sneaker
		elsif user_choice == 'x'
			puts "Thanks for using Joshua's Sneaker Colors"
			exit
		else
			puts "Not a valid entry! Please try again"
		end
end

def add_sneaker
	puts "Type in the name of the brand of the sneaker you would like to add to the Inventory"
	brand_choice = gets.chomp 
	puts "Type in the style for this sneaker"
	style_choice = gets.chomp
	@current_sneaker = Sneaker.new({:brand => brand_choice, :style => style_choice})
	@current_sneaker.save
	sleep(0.5)
	puts "Sneaker has been added"
	add_color
end

def add_color
	puts "Please add a color for this sneaker"
	sleep(0.5)
	color_choice = gets.chomp
	@current_color = Color.new({:name => color_choice})
	@current_color.save
	@current_sneaker_colorway = Sneaker_Colorway.new({:sneaker_id => @current_sneaker.id, :color_id => @current_color.id})
	sleep(0.5)	
	puts "New Sneaker and it's colorway has been added"
		loop do
    puts "Type 'a' to add another sneaker, or 'm' to go back to the main menu."
    choice = gets.chomp
    if choice == 'a'
      add_sneaker
    elsif choice == 'm'
      main_menu
    else
      puts "Not a valid entry, please try again."
    end
	end
	main_menu
end

def list_sneakers
  puts "Here are is a list of all available sneakers"
  Sneaker.all.each do |sneaker|
    puts sneaker.brand + " " + sneaker.style
  end
  puts "Type in the name of the style to view all of its colorways."
  choice = gets.chomp
  Sneaker.all.each do |sneaker|
    if choice == sneaker.style
      @current_sneaker = sneaker
    end
  end
 list_by_color
end

def list_by_color
	sleep(0.5)
	colors = Color.list_sneaker_by_color(@current_sneaker.id)
		colors.each do |color|
			puts color.name
		end
		sleep(5.0)
		main_menu
	end 
end

