class SuppliersController < ApplicationController
  def index
  	@supplier = Supplier.all
  end

  def new
  	@supplier = Supplier.new
  end

  def create
  	@supplier = Supplier.new
    @supplier.rfc = params[:rfc]
    @supplier.nombre = params[:nombre]
  	if @supplier.save
      params[:products].each_value do |array|
        @d_supplier = DSupplier.new
        @d_supplier.supplier = @supplier
        @d_supplier.product = Product.where("id="+array)[0]
        @d_supplier.save
      end
  		redirect_to suppliers_path, :flash =>{:success=>"Proveedor dado de Alta"}
    else
      render :action => "new"
    end
  end

  def destroy
  	@supplier = Supplier.find(params[:id])
  	@supplier.destroy
  	redirect_to suppliers_path, notice:"El proveedor se ha eliminado"
  end

  def edit
  	@supplier = Supplier.find(params[:id])
  end

  def update
  	@supplier = Supplier.find(params[:id])
  	if @supplier.update_attributes params[:supplier]
  		redirect_to suppliers_path, :flash => {success:"Proveedor Actualizado"}
  	else
  		render :action => "edit"
  	end
  end
end