require 'spec_helper'

describe Customer do
	it 'should initalize the name of the customer' do
		test_customer = Customer.new({'name' => 'Boo Radley'})
		expect(test_customer).to be_an_instance_of Customer
		expect(test_customer.name).to eq 'Boo Radley'
	end

	it 'should save the name to the database' do
		test_customer = Customer.new({'name' => 'Boo Radley'})
		test_customer.save
		expect(Customer.all).to eq [test_customer]
	end

	it 'should update the customer name' do
		test_customer = Customer.new({'name' => 'Boo Radley'})
		test_customer.save
		new_name = "Atticus Finch"
		test_customer.update_name(new_name)
		expect(test_customer.name).to eq "Atticus Finch"
		expect(Customer.all).to eq [test_customer]
	end

	it 'should delete the customer from the database' do
		test_customer = Customer.new({'name' => 'Boo Radley'})
		test_customer.save
		test_customer.delete
		expect(Customer.all).to eq []
	end
end