require './lib/customers'
require './lib/menu'

def main_menu

	puts " \n\n--- KITCHEN TICKET APP---\n\n"
	puts " '1' for customer menu."
	puts " '2' for food menu."
	puts " 'x' to exit program."

	case user_decision = gets.chomp
	when user_decision == '1'
		customer_menu
	when user_decision == '2'
		food_menu
	when user_decision == 'x'
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
	puts " '2' for order food."
	puts " 'x' to return back to main menu."

	case user_decision = gets.chomp
	when user_decision == '1'
		create_customer
	when user_decision == '2'
		order_food
	when user_decision == 'x'
		puts "Goodbye Alfred."
		main_menu
	else
		puts "Invalid."
		main_menu
	end

end

def create_customer
	puts "Enter new name:"
	user_decision = gets.chomp
	@customer = Customer.new({:name => user_decision})

end

main_menu