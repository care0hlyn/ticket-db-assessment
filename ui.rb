require './lib/customers'
require './lib/menu'
require 'pg'

DB = PG.connect(:dbname => 'ticket')

@customer

def main_menu
	puts " \n\n--- KITCHEN TICKET APP---\n\n"
	puts " '1' for customer menu."
	puts " 'x' to exit program."

	case user_decision = gets.chomp
	when '1'
		customer_menu
	when 'x'
		puts "Goodbye, Alfred."
		exit
	else 
		puts "Invalid."
		main_menu
	end
end


def customer_menu
	puts " \n\n--- CUSTOMER MENU ---\n\n"
	puts " '1' to create new customer."
	puts " '2' to order food."
	puts " 'x' to return back to main menu."

	case user_decision = gets.chomp
	when '1'
		create_customer
	when '2'
		order_food
	when 'x'
		puts "Goodbye, Alfred."
		main_menu
	else
		puts "Invalid."
		main_menu
	end
end

def create_customer
	puts "Enter new name:"
	user_decision = gets.chomp
	@customer = Customer.new({'name' => user_decision})
	@customer.save

	puts "#{@customer.name} has been saved."

	puts "\n\n Would you like to add an order, #{@customer.name} Y/N?\n\n"

	case user_decision = gets.chomp.downcase
	when 'y'
		order_food
	when 'n'
		puts "Goodbye, Alfred."
	else 
		puts "Invalid."
		main_menu
	end
end

def order_food
	puts "Enter your dinner:"
	user_decision = gets.chomp
	order = Order.new({'food_item' => user_decision})
	order.save
	Order.ticket(@customer.id, order.id)
	puts "#{@customer.name}, your order of #{order.food_item} has been placed."
	main_menu
end

main_menu