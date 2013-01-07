class RequestsController < ApplicationController
   
  before_filter :require_login
  before_filter :require_dulcero, :only => [:index,:new,:create,:edit,:complete_request,:destroy, :update]
  before_filter :require_almacen, :only => [:index_alm, :send_request]

  
  
  def index
    @request = Request.where('status is null or status="f"').order('created_at desc')
  	@complete = Request.where('status="t"').limit(5).order('updated_at desc')
  end

  def index_alm
    @request = Request.where('status is null').order('created_at desc')
  	@complete = Request.where('status="f"').limit(5).order('updated_at desc')
  end

  def new
  	@request = Request.new
  end

  def create
  	@request = Request.new 
    
    @request.amount = params[:request][:amount]
    @request.product_id = params[:request][:product_id]
    @request.status = nil
    #@request.user_id = current_user.id 

  	if @request.save
  		redirect_to requests_path, :flash =>{:success=>"Nueva peticion enviada"}
    else
      render :action => "new"
    end
  end

  def edit
	  @request = Request.find params[:id]
  end

  def complete_request
  	#render :text => params.inspect
    @request = Request.find(params[:request_id])
    @request.recibido = params[:cantidad]
  	@request.status = true
    @request.product.cantDulc += @request.recibido
    @request.product.save 
    @request.save
    redirect_to requests_path, :flash => {:success => "Peticion completada"}
  end 

  def send_request
    @request = Request.find(params[:request_id])
    @request.enviado = params[:cantidad]
  	@request.status = false
    @request.product.cantAlm -= @request.enviado
    @request.product.save 
    @request.save

    redirect_to "/requests/index_alm", :flash => {:success => "Peticion completada"}
 
  end

  def destroy
  	Request.destroy params[:id]
	  redirect_to requests_path, notice:"Peticion Eliminada"
  end

  def update
  	@request = Request.find params[:id]
    @request.amount = params[:request][:amount]

	if @request.save
		redirect_to requests_path, notice:"Peticion Modificada"
	else
	  render :action => "edit"
	end
  end

end
