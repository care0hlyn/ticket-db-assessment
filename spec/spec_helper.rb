require 'orders'
require 'customers'
require 'rspec'
require 'pg'

DB = PG.connect({:dbname => 'ticket_test'})

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM customers *;")
		DB.exec("DELETE FROM orders *;")
	end
end