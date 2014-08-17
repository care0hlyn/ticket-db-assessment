class Order

	attr_reader :id, :food_item

	def initialize attributes
		@id = attributes['id'].to_i
		@food_item = attributes['food_item']
	end

	def == another_order
		self.id == another_order.id &&
		self.food_item == another_order.food_item
	end

	def self.all
		results = DB.exec("SELECT * FROM menu;")
		orders = []
		results.each do |result|
		 	orders << Order.new(result)
		 end
		orders
	end

	def self.ticket(customer_id, order_id)
		results = DB.exec("INSERT INTO ticket (customer_id, order_id) VALUES (#{customer_id}, #{order_id}) RETURNING id;")
		ticket_id = results.first['id'].to_i
	end

	def self.list_customer_order(customer_id)
		results = DB.exec("SELECT menu. * FROM 

			customers JOIN ticket ON (customers.id = ticket.customer_id) 
			JOIN menu ON (menu.id = ticket.order_id) 

			WHERE customers.id = #{customer_id};")
		orders = []
		results.each do |result|
			new_orders = Order.new(result)
			orders << new_orders
		end
		orders
	end

	def save
		results = DB.exec("INSERT INTO menu (food_item) VALUES ('#{@food_item}') RETURNING id;")
		@id = results.first['id'].to_i
	end

	def update_order(new_order)
		@food_item = new_order
		DB.exec("UPDATE menu SET food_item = '#{@food_item}' WHERE id = #{@id};")
	end

	def delete
		DB.exec("DELETE FROM menu WHERE id = #{@id};")
	end

end