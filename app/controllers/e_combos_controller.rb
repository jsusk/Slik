class ECombosController < ApplicationController
  def index
		@combos = ECombo.all
  end

	def show
		@combo = ECombo.find(params[:id])
	end

	def new
	
	end
end
