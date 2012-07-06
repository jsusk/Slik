class ProductsController < ApplicationController
  def index
		@products = Product.all
  end
	def new
		@product = Product.new	
	end

	def create 
		Product.create params[:product]
		redirect_to products_path
	end

	def edit
		@product = Product.find params[:id]
	
	end

	def update
		product = Product.find params[:id]
		if product.update_attributes params[:product]
			redirect_to products_path
		else
			redirect_to :back
		end
	end

	def destroy
		Product.destroy params[:id]
		redirect_to products_path
	end

end
