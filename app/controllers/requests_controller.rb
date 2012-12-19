class RequestsController < ApplicationController
  
  def index
  	@request = Request.where('status="f"').order('created_at desc')
  	@complete = Request.where('status="t"').limit(5).order('updated_at desc')
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
  	#render :text => params[:request_id].to_s + " " + params[:cantidad].to_s
    @request = Request.find(params[:request_id])
    @request.recibido = params[:cantidad]
  	@request.status = true
    @request.product.cantDulc += @request.recibido
    @request.product.save 
    @request.save

    redirect_to requests_path, :flash => {:success => "Peticion completada"}
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

  def edit
	@request = Request.find params[:id]
  end
end
