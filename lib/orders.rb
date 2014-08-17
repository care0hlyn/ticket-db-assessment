class Order

	attr_reader :id, :customer_id, :food_order

	def initialize attributes
		@id = attributes['id'].to_i
		@customer_id = attributes['customer_id'].to_i
		@food_order = attributes['food_order']
	end

	def == another_order
		self.id == another_order.id &&
		self.customer_id == another_order.customer_id &&
		self.food_order == another_order.food_order
	end

	def self.all
		results = DB.exec("SELECT * FROM orders;")
		orders = []
		results.each do |result|
		 	orders << Order.new(result)
		 end
		orders
	end

	def add_customer(customer_id)
		DB.exec("INSERT INTO orders (customer_id, food_order) VALUES (#{@customer_id}, '#{@food_order}');")
	end

	def save
		results = DB.exec("INSERT INTO orders (customer_id, food_order) VALUES (#{@customer_id}, '#{@food_order}') RETURNING id;")
		@id = results.first['id'].to_i
	end

	def update_order(new_order)
		@food_order = new_order
		DB.exec("UPDATE orders SET food_order = '#{@food_order}' WHERE id = #{@id};")
	end

	def delete
		DB.exec("DELETE FROM orders WHERE id = #{@id};")
	end

end