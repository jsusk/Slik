class DSalesController < ApplicationController

  before_filter :require_login
  before_filter :require_dulcero
  
  def new 
    @cart = current_cart 
    @p_and_c = @cart.d_sales.includes(:product, :e_combo)
  end

  def create
    id = params[:product_id]
    tipo = params[:product_type]
    cantidad = params[:cantidad]
    
    @cart = current_cart
    @p_and_c = @cart.d_sales.includes(:product, :e_combo)
    cp = 0

    @cart.d_sales.each do |abc|
      #puts "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
      #puts "=====================>" + abc.product_id.to_s + "====== " +
      if abc.product_id == id.to_i
        cp = abc.cantidad

        puts "===============================H>" + abc.cantidad.to_s
      end
    end

    

    if (cantidad.to_i + cp) > (cD = Product.where('id=' + id)[0].cantDulc)
      cantidad = cD - cp
    end
    

    @item = @cart.add_product(id,tipo,cantidad)

    if @item.save
      redirect_to new_d_sale_path, :flash=>{:success=>"Producto agregado"}
    else
      render :action => "new"
    end 
  end
  
  def destroy
    @d_sale = DSale.find(params[:id])
    @d_sale.destroy
    redirect_to new_d_sale_path, :notice=>"Producto eliminado"

  end
end
