require 'spec_helper'

describe Order do
	it 'should initalize the name of the order' do
		test_order = Order.new({'food_order' => 'fried green tomatoes'})
		expect(test_order).to be_an_instance_of Order
		expect(test_order.food_order).to eq 'fried green tomatoes'
	end

	it 'should save the order to the database' do
		test_order = Order.new({'food_order' => 'fried green tomatoes'})
		test_order.save
		expect(Order.all).to eq [test_order]
	end

	it 'should update the order' do
		test_order = Order.new({'food_order' => 'fried green tomatoes'})
		test_order.save
		new_order = "fried red tomatoes"
		test_order.update_order(new_order)
		expect(test_order.food_order).to eq "fried red tomatoes"
		expect(Order.all).to eq [test_order]
	end

	it 'should delete the order from the database' do
		test_order = Order.new({'food_order' => 'fried green tomatoes'})
		test_order.save
		test_order.delete
		expect(Order.all).to eq []
	end
end