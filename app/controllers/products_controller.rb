class ProductsController < ApplicationController
  
  before_filter :require_login
  before_filter :require_almacen, :except => [:search_on_product]

  def index
		@products = Product.all
  end
	def new
		@product = Product.new	
	end

	def create 
		@product = Product.new params[:product]
		if @product.save
      redirect_to products_path, :flash =>{:success=>"Producto dado de alta"}
    else
      render :action => "new"
    end
	end

	def edit
		@product = Product.find params[:id]
	
	end

	def update
		@product = Product.find params[:id]
		if @product.update_attributes params[:product]
			redirect_to products_path, notice:"Modificado correctamente"
		else
		  render :action => "edit"
		end
	end

	def destroy
		Product.destroy params[:id]
		redirect_to products_path, notice:"Eliminado correctamente"
	end

	def buscar
		nombre = params[:nombre]
		#render :text => params.collect
		productos = Product.where("name like '%#{nombre}%'")
		combos = ECombo.where("nombre like '%#{nombre}%'")
		@final = productos | combos
		respond_to do |format|
			format.js
		end
	end

  def search_on_product
    products = Product.where("name like '%#{params[:term]}%'")
    result = []
    products.each do |c|
      result << {:label => c.name, :value => c.id}
    end
    render :json => result 
  end



end
