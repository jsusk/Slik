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

    if tipo == "product"
      @cart.d_sales.each do |abc|
        #puts "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
        #puts "=====================>" + abc.product_id.to_s + "====== " 
        if abc.product_id
          if abc.product_id == id.to_i
            cp += abc.cantidad
            #puts "===============================H>" + abc.cantidad.to_s
          end
        else
          abc.e_combo.d_combos.each do |dc|
            if dc.product_id == id.to_i
              cp += dc.cantidad * abc.cantidad
              puts "===============================H>" + dc.cantidad.to_s
            end
          end
        end
      end
      puts "===============================H>" + cp.to_s


      if (cantidad.to_i + cp) > (cD = Product.where('id=' + id)[0].cantDulc)
        cantidad = cD - cp
      end
    else
      combo = ECombo.where('id='+id)[0]
      combo.d_combos.each do |dc|
        cantTot = dc.cantidad * cantidad.to_i
        #puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + cantTot.to_s
        @cart.d_sales.each do |abc|      

          if abc.product_id
            if abc.product_id == dc.product_id
              cp += abc.cantidad
            end
          else
            abc.e_combo.d_combos.each do |dcc|
              if dcc.product_id == id.to_i
                cp += dcc.cantidad * abc.cantidad
                #puts "===============================H>" + dc.cantidad.to_s
              end
            end
          end


        end
        cantTot += cp
        #puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + cantTot.to_s
        cantTot -= dc.product.cantDulc
        #puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + cantTot.to_s
        if cantTot>0
          redirect_to new_d_sale_path, :flash=>{:notice=>"Producto insuficiente en Dulceria."}
          return
        end
      end
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
