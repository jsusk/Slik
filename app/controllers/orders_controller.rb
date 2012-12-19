class OrdersController < ApplicationController
	def index
	end

	def search_suppliers
		@suppliers = DSupplier.where("product_id="+params['id'])
		render :partial => 'search_suppliers', :locals => {:suppliers => @suppliers}
	end

	def create
		params[:order].each_value do |array|
			@order = Order.new
			@order.d_supplier = DSupplier.where("product_id=" + array[:product] + " and supplier_id=" + array[:supplier])[0];
			@order.cantidad = array[:cantidad]
			@order.d_supplier.product.cantAlm += @order.cantidad;
			@order.factura = array[:factura]
			@order.save
			@order.d_supplier.product.save
		end
		redirect_to orders_path,:flash=>{:success=>"Dado de alta."}
	end
end
