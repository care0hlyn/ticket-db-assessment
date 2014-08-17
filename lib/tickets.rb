class Ticket

	attr_reader :id, :customer_id, :order_id

	def initalize attributes
		@id = attributes['id'].to_i
		@customer_id = attributes['customer_id'].to_i
		@order_id = attributes['order_id'].to_i
	end

end