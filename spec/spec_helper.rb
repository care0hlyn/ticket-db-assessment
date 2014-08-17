require 'orders'
require 'customers'
require 'tickets'
require 'rspec'
require 'pg'

DB = PG.connect(:dbname => 'ticket_test')

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM customers *;")
		DB.exec("DELETE FROM orders *;")
		DB.exec("DELETE FROM tickets *;")
	end
end