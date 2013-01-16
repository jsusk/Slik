class GiftsController < ApplicationController

	before_filter :require_login
	before_filter :require_dulcero, :only => [:new,:create]
	before_filter :require_administrador, :only => [:index]

	def index
		@gifts = Gift.where('MONTH(DATE(created_at))=\'' + (Time.now.month).to_s + '\'')
	end

	def new
		@gift = Gift.new
	end

	def create
		@gift = Gift.new 

		@gift.cantidad = params[:gift][:cantidad]
		@gift.product_id = params[:gift][:product_id]
		@gift.user_id = current_user.id
		@gift.motivo = params[:gift][:motivo]
		if @gift.cantidad > @gift.product.cantDulc
			@gift.cantidad = @gift.product.cantDulc
		end
		@gift.product.cantDulc -= @gift.cantidad
		@gift.product.save

		if @gift.save
			redirect_to new_d_sale_path, :flash =>{:success=>"Baja completada: " + @gift.cantidad.to_s + " " + @gift.product.name}
		else
			render :action => "new"
		end
	end
end
