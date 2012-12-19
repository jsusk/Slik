class OrdersController < ApplicationController
	def index
		@order = Order.new
	end
end
