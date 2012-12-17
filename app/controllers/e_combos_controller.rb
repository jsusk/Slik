class ECombosController < ApplicationController
  def index
		@combos = ECombo.all
  end

	def show
		@combo  = ECombo.find(params[:id])
    @dcombo = DCombo.includes(:product).where("e_combo_id = #{params[:id]}")
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
    if @ecombo.update_attributes(params[:e_combo])
      redirect_to @ecombo, :flash => {:success => "Combo modificado exitosamente"}
    else
      render :action => "edit"
    end
  end

  def create
    @ecombo = ECombo.new(params[:e_combo])
    if @ecombo.save 
      redirect_to e_combos_path, :flash =>{success:"Combo dado de alta"}
    else
      render :action => "new"
    end
  end
  def destroy
    ECombo.destroy params[:id]
    redirect_to e_combos_path, :notice => "Eliminado correctamente"
  end
  
  def search_on_p_and_c
    products = Product.where("name like '%#{params[:term]}%'")
    combos = ECombo.where("nombre like '%#{params[:term]}%'")
    @final = products | combos
    result = []
    @final.each do |c|
      tipo = c.respond_to?(:name) ? :product : :combo

      result << {:label=> (c.respond_to?(:name) ? c.name : c.nombre), :value=>{:id=>c.id, :tipo=>tipo}}
    end
    render :json=>result
  end

  def search_on_p
    products = Product.where("name like '%#{params[:term]}%'")
    
    @final = products
    result = []
    @final.each do |c|
      tipo = c.respond_to?(:name) ? :product : :combo

      result << {:label=> (c.respond_to?(:name) ? c.name : c.nombre), :value=>{:id=>c.id, :tipo=>tipo}}
    end
    render :json=>result
  end

end
