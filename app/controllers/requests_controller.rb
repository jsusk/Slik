class RequestsController < ApplicationController
  
  def index
  	@request = Request.find(:select => "where status=false order by created_at desc")
  	@complete = Request.find(:select => "where status=true order by updated_at desc limit 5")
  end

  def new
  	@request = Request.new
  end

  def create
  	@request = Request.new params[:request]
  	if @request.save
  		redirect_to requests_path, :flash =>{:success=>"Nueva petición enviada"}
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
	redirect_to requests_path, notice:"Petición Eliminada"
  end

  def update
  	@request = Request.find params[:id]
	if @request.update_attributes params[:product]
		redirect_to requests_path, notice:"Petición Modificada"
	else
	  render :action => "edit"
	end
  end

  def edit
	@request = Request.find params[:id]
  end
end
