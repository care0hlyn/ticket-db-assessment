require 'spec_helper'

describe Customer do
	it 'should initalize the name of the customer' do
		test_customer = Customer.new({'name' => 'Boo Radley'})
		expect(test_customer).to be_an_instance_of Customer
		expect(test_customer.name).to eq 'Boo Radley'
	end
end