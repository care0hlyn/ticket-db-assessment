require 'spec_helper'
require 'pry'

describe Order do
	it 'should initalize the name of the order' do
		test_order = Order.new({'food_item' => 'fried green tomatoes'})
		expect(test_order).to be_an_instance_of Order
		expect(test_order.food_item).to eq 'fried green tomatoes'
	end

	it 'should save the order to the database' do
		test_order = Order.new({'food_item' => 'fried green tomatoes'})
		test_order.save
		expect(Order.all).to eq [test_order]
	end

	it 'should update the order' do
		test_order = Order.new({'food_item' => 'fried green tomatoes'})
		test_order.save
		new_order = "fried red tomatoes"
		test_order.update_order(new_order)
		expect(test_order.food_item).to eq "fried red tomatoes"
		expect(Order.all).to eq [test_order]
	end

	it 'should delete the order from the database' do
		test_order = Order.new({'food_item' => 'fried green tomatoes'})
		test_order.save
		test_order.delete
		expect(Order.all).to eq []
	end

	it 'should create a new ticket to match the customer with their order in the database' do
		test_customer = Customer.new({'name' => 'Boo Radley'})
		test_customer.save
		test_order = Order.new({'food_item' => 'fried green tomatoes'})
		test_order1 = Order.new({'food_item' => 'burrito'})
		test_order.save
		test_order1.save
		Order.ticket(test_customer.id, test_order.id)
		Order.ticket(test_customer.id, test_order1.id)
	 	orders = Order.list_customer_order(test_customer.id)
	 	expect(orders).to eq [test_order, test_order1]
	end

end