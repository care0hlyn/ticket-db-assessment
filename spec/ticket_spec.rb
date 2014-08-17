require 'spec_helper'

describe Ticket do
	
	it 'should initalize the order' do
		test_customer = Customer.new({'name' => 'Boo Radley'})
		test_customer.save
		test_order = Order.new({'food_order' => 'fried green tomatoes'})
		test_order.save
		test_ticket = Ticket.new(test_customer, test_ticket)
		expect(test_ticket).to eq [test_customer.id, test_ticket.id]
	end
end