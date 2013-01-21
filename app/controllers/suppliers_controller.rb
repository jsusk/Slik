class SuppliersController < ApplicationController
  
  before_filter :require_login
  before_filter :require_almacen

  def index
  	@supplier = Supplier.all
  end

  def new
  	@supplier = Supplier.new
    @supplier.rfc = ""
    @supplier.nombre = ""
  end

  def create
  	@supplier = Supplier.new
    @supplier.rfc = params[:rfc]
    @supplier.nombre = params[:nombre]
  	if @supplier.save
      if params[:products] != nil
        params[:products].each_value do |array|
          @supplier.products << Product.where("id="+array)[0]
        end
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
    @supplier.products = []
  	if @supplier.update_attributes :rfc=>params[:rfc], :nombre=>params[:nombre]
      params[:products].each_value do |array|
        @supplier.products << Product.where("id="+array)[0]
      end
  		redirect_to suppliers_path, :flash => {success:"Proveedor Actualizado"}
  	else
  		render :action => "edit"
  	end
  end
end
