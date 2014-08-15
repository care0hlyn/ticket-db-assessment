class Customer
	attr_reader :id, :name

	def initialize attributes
		@id = attributes['id'].to_i
		@name = attributes['name']
	end

	def == another_customer
		self.name == another_customer.name &&
		self.id == another_customer.id
	end

	def self.all
		results = DB.exec("SELECT * FROM customers;")
		customers = []
		results.each do |result|
		 	customers << Customer.new(result)
		 end
		customers
	end

	def save
		results = DB.exec("INSERT INTO customers (name) VALUES ('#{@name}') RETURNING id;")
		@id = results.first['id'].to_i
	end

	def update_name(new_name)
		@name = new_name
		DB.exec("UPDATE customers SET name = '#{new_name}' WHERE id = #{@id};")
	end
end