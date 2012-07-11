class ECombosController < ApplicationController
  def index
		@combos = ECombo.all
  end

	def show
		@combo = ECombo.find(params[:id])
	end

	def new
	  @ecombo = ECombo.new
    4.times{ @ecombo.d_combos.build}
	end
  def create
    ECombo.create(params[:e_combo])
    redirect_to e_combos_path
  end
  def destroy
    ECombo.destroy params[:id]
    redirect_to e_combos_path
  end
end
