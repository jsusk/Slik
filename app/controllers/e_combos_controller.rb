class ECombosController < ApplicationController
  def index
		@combos = ECombo.all
  end

	def show
		@combo = ECombo.find(params[:id])
	end

	def new
	  @ecombo = ECombo.new
	end
  
  def edit
    @ecombo = ECombo.find(params[:id])
    products = @ecombo.products
    @pro_hash = {};
    products.each do |p|
      @pro_hash[p.id] = p.name 
    end 
  end
  
  def update
    @ecombo = ECombo.find(params[:id])
    @ecombo.update_attributes(params[:e_combo])
    redirect_to e_combos_path
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
