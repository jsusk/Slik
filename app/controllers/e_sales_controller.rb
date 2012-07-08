class ESalesController < ApplicationController
  def new
		if session[:venta_id].nil?
			@nueva_venta = ESale.create(:fecha => Time.now.strftime('%m/%d/%Y'))
			session[:venta_id] = @nueva_venta
		else
			@nueva_venta = current_sale
		end
  end
	def destroy
		current_sale.destroy
		session[:venta_id] = nil

	end
	def current_sale
		 ESale.find(session[:venta_id])
	end

	def show
		venta = ESale.find(params[:id])
		detalles = venta.d_sales
		@productos = []
		detalles.each do |d|
			@productos << Product.find(d.product_id)
		end
	end

	def update
		product = Product.find(params[:id])
		venta = current_sale
		venta.d_sales.build(:product => product)
		venta.save
		puts "Hola"
		redirect_to new_e_sale_path
		
	end

end
