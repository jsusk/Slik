class RequestsController < ApplicationController
  
  def index
  	@request = Request.where('status="false"').order('created_at desc')
  	@complete = Request.where('status="true"').limit(5).order('updated_at desc')
  end

  def new
  	@request = Request.new
  end

  def create
  	@request = Request.new params[:request]
  	if @request.save
  		redirect_to requests_path, :flash =>{:success=>"Nueva peticion enviada"}
    else
      render :action => "new"
    end
  end

  def edit
	  @request = Request.find params[:id]
  end

  def complete
  	@request = Request.find(params[:id])
  	@request.status = true
  end 

  def destroy
  	Request.destroy params[:id]
	  redirect_to requests_path, notice:"Peticion Eliminada"
  end

  def update
  	@request = Request.find params[:id]
	if @request.update_attributes params[:product]
		redirect_to requests_path, notice:"Peticion Modificada"
	else
	  render :action => "edit"
	end
  end

  def edit
	@request = Request.find params[:id]
  end
end
